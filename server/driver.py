"""
This file is part of Dycapo.
    Copyright (C) 2009, 2010 FBK Foundation, (http://www.fbk.eu)
    Authors: SoNet Group (see AUTHORS)
    Dycapo is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Dycapo is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with Dycapo.  If not, see <http://www.gnu.org/licenses/>.

"""
"""
This module holds all the XML-RPC methods that a Driver needs.
"""
from rpc4django import rpcmethod
from django.db import IntegrityError
from models import Trip, Location, Person, Mode, Participation, Prefs, Response
from datetime import datetime
from utils import populate_object_from_dictionary, get_xmlrpc_user, clean_ids
import response_codes
from django.core.exceptions import ValidationError

@rpcmethod(name='dycapo.add_trip', signature=['Response','Trip','Mode','Prefs','Location','Location'], permission='server.can_xmlrpc')
def add_trip(trip, mode, preferences, source, destination, **kwargs):
        """
        Inserts a new Trip in Dycapo System. It supports a source, a destination and
        the trip mode. See the models for more information.
        
        TODO
        
        - verify user permissions
        - multiple waypoints
    
        PARAMETERS
    
        - ``trip`` - a **Trip** object, representing the Trip that the Driver is willing to save
        - ``mode`` - a **Mode** object, representing the modalities of the Trip
        - ``preferences`` - a **Prefs** object, representing the Trip preferences
        - ``source`` - a **Location** object, representing where the Trip will start.
        - ``destination`` - a **Location** object, representing where the Trip will end.
    
        RETURNS 
    
        An object of type **Response**, containing all the details of the operation and results (if any)
        """
        dict_trip = clean_ids(trip)
        dict_mode = clean_ids(mode)
        dict_prefs = clean_ids(preferences)
        dict_source= clean_ids(source)
        dict_destination = clean_ids(destination)
        
        driver = get_xmlrpc_user(kwargs)
        
        source = Location()
        source = populate_object_from_dictionary(source,dict_source)
        
        
        destination = Location()
        destination = populate_object_from_dictionary(destination,dict_destination)
        
        mode = Mode()
        mode = populate_object_from_dictionary(mode,dict_mode)
       
        
        preferences = Prefs()
        preferences = populate_object_from_dictionary(preferences,dict_prefs)
        
        try:
            source.save()
            destination.save()
            mode.save()
            preferences.save()
        except Exception, e:
            resp = Response(response_codes.NEGATIVE,str(e),"boolean",False)
            return resp.to_xmlrpc()
            
        trip = Trip()
        trip = populate_object_from_dictionary(trip,dict_trip)
        trip.author = driver
        trip.mode = mode
        trip.prefs = preferences
        try:
            trip.save()
        except Exception, e:
            resp = Response(response_codes.NEGATIVE,str(e),"boolean",False)
            return resp.to_xmlrpc()
        
        trip.locations.add(source)
        trip.locations.add(destination)
    

        participation = Participation()
        participation.person = driver
        participation.trip = trip
        participation.role = 'driver'
        participation.save()
        trip_stored = Trip.objects.get(id=trip.id)
        resp = Response(response_codes.POSITIVE,response_codes.TRIP_INSERTED,"Trip",trip_stored.to_xmlrpc())
        return resp.to_xmlrpc()

@rpcmethod(name='dycapo.start_trip', signature=['Response','Trip'], permission='server.can_xmlrpc')
def start_trip(trip, **kwargs):
        """
        Starts a Trip
        
        TODO
        
        - verify user permissions
    
        PARAMETERS
    
        - ``trip`` - a **Trip** object, representing the Trip that the Driver is starting
    
        RETURNS 
    
        An object of type **Response**, containing all the details of the operation and results (if any)
        """
        trip_dict = trip
        try:
            trip = Trip.objects.get(id=trip_dict['id'])
        except Trip.DoesNotExist:
            resp = Response(response_codes.NEGATIVE,response_codes.TRIP_NOT_FOUND,"Trip",trip_dict)
            return resp.to_xmlrpc()
        participation = Participation.objects.get(trip=trip,role='driver')
        driver = get_xmlrpc_user(kwargs)
        
        # return False if the driver already started this trip
        if participation.started:
                resp = Response(response_codes.NEGATIVE,response_codes.TRIP_ALREADY_STARTED,"boolean",False)
                return resp.to_xmlrpc()
        
        participation.started = True
        participation.started_timestamp = datetime.now()
        try:
            participation.started_position = driver.position
        except Location.DoesNotExist:
            participation.started_position = None
        participation.save()
        trip.active = True
        trip.save()
        
        resp = Response(response_codes.POSITIVE,response_codes.TRIP_STARTED,"boolean",True)
        return resp.to_xmlrpc()


@rpcmethod(name='dycapo.check_ride_requests', signature=['Response','Trip'], permission='server.can_xmlrpc')
def check_ride_requests(trip, **kwargs):
        """
        This method is for a driver to see if there are ride requests for his Trip
        
        TODO
        
        -verify user permissions
        -what if there is more than a ride request? Should we return just one per time?
    
        PARAMETERS
    
        - ``trip`` - a **Trip** object, representing the Trip that the Driver is checking
    
        RETURNS 
    
        An object of type **Response**, containing all the details of the operation and results (if any)
        """
        trip_dict = trip

        try:
            trip = Trip.objects.get(id=trip_dict['id'])
        except Trip.DoesNotExist:
            resp = Response(response_codes.NEGATIVE,response_codes.TRIP_NOT_FOUND,"Trip",trip_dict)
            return resp.to_xmlrpc()
        driver = get_xmlrpc_user(kwargs)

        participations_for_trip = Participation.objects.filter(trip=trip).exclude(person=driver)

        if len(participations_for_trip) == 0:
                resp = Response(response_codes.NEGATIVE,response_codes.RIDE_REQUESTS_NOT_FOUND,"boolean",False)
                return resp.to_xmlrpc()
        else:
                for participation in participations_for_trip:
                        if participation.requested:
                                resp = Response(response_codes.POSITIVE,response_codes.RIDE_REQUESTS_FOUND,"Person",participation.person.to_xmlrpc())
                                return resp.to_xmlrpc()
                            
        resp = Response(response_codes.NEGATIVE,response_codes.RIDE_REQUESTS_NOT_FOUND,"boolean",False)
        return resp.to_xmlrpc()


@rpcmethod(name='dycapo.accept_ride_request', signature=['Response','Trip','Person'], permission='server.can_xmlrpc')
def accept_ride_request(trip, person, **kwargs):
        """
        his method is for a driver to accept a ride request by a rider.
        
        TODO
        
        -verify user permissions
    
        PARAMETERS
    
        - ``trip`` - a **Trip** object, representing the Trip in which the Driver is accepting a ride.
        - ``person`` - a **Person** object, representing the Rider that the Driver is accepting
    
        RETURNS 
    
        An object of type **Response**, containing all the details of the operation and results (if any)
        """

        trip_dict = trip
        person_dict = person
        
        try:
            trip = Trip.objects.get(id=trip_dict['id'])
        except Trip.DoesNotExist:
            resp = Response(response_codes.NEGATIVE,response_codes.TRIP_NOT_FOUND,"Trip",trip_dict)
            return resp.to_xmlrpc()
        
        try:
            rider = Person.objects.get(username=person_dict['username'])
        except Trip.DoesNotExist:
            resp = Response(response_codes.NEGATIVE,response_codes.PERSON_NOT_FOUND,"Trip",person_dict)
            return resp.to_xmlrpc()
        
        
        rider_participation = Participation.objects.get(trip=trip,person=rider)
        if rider_participation.requested and not rider_participation.accepted:
                rider_participation.accepted = True
                rider_participation.accepted_timestamp = datetime.now()
                try:
                    rider_participation.accepted_position = rider.position
                except Location.DoesNotExist:
                    rider_participation.accepted_position = None
                rider_participation.save()
                resp = Response(response_codes.POSITIVE,response_codes.RIDE_REQUEST_ACCEPTED,"boolean",True)
                return resp.to_xmlrpc()
        
        resp = Response(response_codes.NEGATIVE,response_codes.RIDE_REQUEST_REFUSED,"boolean",False)
        return resp.to_xmlrpc()

        

@rpcmethod(name='dycapo.delete_trip', signature=['Response','Trip'], permission='server.can_xmlrpc')
def delete_trip(trip):
        """
        This method is only for testing. It will be removed in the final version of Dycapo!
        """
        trip_dict = trip
        trip = Trip.objects.get(id=trip_dict['id'])
        for location in trip.locations.all():
                location.delete()
        trip.mode.delete()
        trip.prefs.delete()
        trip.participation.clear()
        trip.delete()
        resp = Response(response_codes.POSITIVE,response_codes.TRIP_DELETED,"boolean",True)
        return resp.to_xmlrpc()
        