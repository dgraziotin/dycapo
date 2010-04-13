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
from models import Trip, Location, Person, Mode, Participation, Prefs, Response
from datetime import datetime
from utils import populate_object_from_dictionary, get_xmlrpc_user
import response_codes

@rpcmethod(name='dycapo.add_trip', signature=['Response','Trip','Mode','Prefs','Location','Location'], permission='server.can_xmlrpc')
def add_trip(trip, mode, preferences, source, destination, **kwargs):
        """
        Inserts a new Trip in Dycapo System. It supports a source, a destination and
        the trip mode. See the models for more information.
        """
        dict_trip = trip
        dict_mode = mode
        dict_prefs = preferences
        dict_source= source
        dict_destination = destination
        
        driver = get_xmlrpc_user(kwargs)
        
        source = Location()
        source = populate_object_from_dictionary(source,dict_source)
        source.save()
        
        destination = Location()
        destination = populate_object_from_dictionary(destination,dict_destination)
        destination.save()
        
        mode = Mode()
        mode = populate_object_from_dictionary(mode,dict_mode)
        mode.save()
        
        preferences = Prefs()
        preferences = populate_object_from_dictionary(preferences,dict_prefs)
        preferences.save()
        
        trip = Trip()
        trip = populate_object_from_dictionary(trip,dict_trip)
        trip.author = driver
        trip.mode = mode
        trip.prefs = preferences
        trip.save()
        trip.locations.add(source)
        trip.locations.add(destination)
        trip.save()
        

        participation = Participation()
        participation.person = driver
        participation.trip = trip
        participation.role = 'driver'
        participation.save()
        
        resp = Response(response_codes.POSITIVE,response_codes.TRIP_INSERTED,"Trip",trip.to_xmlrpc())
        return resp

@rpcmethod(name='dycapo.start_trip', signature=['Response','Trip'], permission='server.can_xmlrpc')
def start_trip(trip):
        """
        TODO:
        -verify user permissions
        """
        trip_dict = trip
        trip = Trip.objects.get(id=trip_dict['id'])
        participation = Participation.objects.get(trip=trip,role='driver')
        
        # return False if the driver already started this trip
        if participation.started:
                resp = Response(response_codes.NEGATIVE,response_codes.TRIP_ALREADY_STARTED,str(False.__class__),False)
                return resp
        
        participation.started = True
        participation.started_timestamp = datetime.now()
        participation.save()
        trip.active = True
        trip.save()
        
        resp = Response(response_codes.POSITIVE,response_codes.TRIP_STARTED,str(True.__class__),True)
        return resp


@rpcmethod(name='dycapo.check_ride_requests', signature=['Response','Trip'], permission='server.can_xmlrpc')
def check_ride_requests(trip, **kwargs):
        """
        This method is for a driver to see if there are ride requests for his Trip
        TODO:
        -verify user permissions
        -what if there is more than a ride request? Should we return just one per time?
        """
        trip_dict = trip

        trip = Trip.objects.get(id=trip_dict['id'])
        driver = get_xmlrpc_user(kwargs)

        participations_for_trip = Participation.objects.filter(trip=trip).exclude(person=driver)

        if len(participations_for_trip) == 0:
                resp = Response(response_codes.NEGATIVE,response_codes.RIDE_REQUESTS_NOT_FOUND,str(False.__class__),False)
                return resp
        else:
                for participation in participations_for_trip:
                        if participation.requested:
                                resp = Response(response_codes.POSITIVE,response_codes.RIDE_REQUESTS_FOUND,"Person",participation.person.to_xmlrpc())
                                return resp
                            
        resp = Response(response_codes.NEGATIVE,response_codes.RIDE_REQUESTS_NOT_FOUND,str(False.__class__),False)
        return resp


@rpcmethod(name='dycapo.accept_ride_request', signature=['Response','Trip','Person'], permission='server.can_xmlrpc')
def accept_ride_request(trip, person):
        """
        This method is for a driver to accept a ride request by a rider.
        TODO:
        -verify user permissions
        """ 
        trip_dict = trip
        person_dict = person
        
        trip = Trip.objects.get(id=trip_dict['id'])
        rider = Person.objects.get(username=person_dict['username'])
        
        rider_participation = Participation.objects.get(trip=trip,person=rider)
        if rider_participation.requested and not rider_participation.accepted:
                rider_participation.accepted = True
                rider_participation.accepted_timestamp = datetime.now()
                rider_participation.save()
                resp = Response(response_codes.POSITIVE,response_codes.RIDE_REQUEST_ACCEPTED,str(True.__class__),True)
                return resp
        resp = Response(response_codes.NEGATIVE,response_codes.RIDE_REQUEST_REFUSED,str(False.__class__),False)
        return resp

        

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
        resp = Response(response_codes.POSITIVE,response_codes.TRIP_DELETED,str(True.__class__),True)
        return resp
        