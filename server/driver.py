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
from models import Trip, Location, Person, Mode, Participation, Prefs
from datetime import datetime
from utils import atom_to_dycapo, populate_object_from_dictionary, get_xmlrpc_user

@rpcmethod(name='dycapo.add_trip', signature=['bool','Trip','Mode','Prefs','Location','Location'], permission='server.can_xmlrpc')
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
        
        # we just use driver1 as driver right now. We must wait for rpc4django to inflate
        # a User object in the functions for using the real driver
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
        return trip.to_xmlrpc()

@rpcmethod(name='dycapo.start_trip', signature=['bool','Trip'], permission='server.can_xmlrpc')
def start_trip(trip):
        """
        TODO:
        -verify user permissions
        """
        trip_dict = atom_to_dycapo(trip)
        trip = Trip.objects.get(id=trip_dict['id'])
        participation = Participation.objects.get(trip=trip,role='driver')
        
        # return False if the driver already started this trip
        if participation.started:
                return False
        
        participation.started = True
        participation.started_timestamp = datetime.now()
        participation.save()
        trip.active = True
        trip.save()
        return True

@rpcmethod(name='dycapo.check_ride_requests', signature=['bool','Trip'], permission='server.can_xmlrpc')
def check_ride_requests(trip, **kwargs):
        """
        This method is for a driver to see if there are ride requests for his Trip
        TODO:
        -verify user permissions
        -what if there is more than a ride request? Should we return just one per time?
        """
        trip_dict = atom_to_dycapo(trip)

        trip = Trip.objects.get(id=trip_dict['id'])
        driver = get_xmlrpc_user(kwargs)

        participations_for_trip = Participation.objects.filter(trip=trip).exclude(person=driver)

        if len(participations_for_trip) == 0:
                return False
        else:
                for participation in participations_for_trip:
                        if participation.requested:
                                return participation.person.to_xmlrpc()
        return False


@rpcmethod(name='dycapo.accept_ride_request', signature=['bool','Trip','Person'], permission='server.can_xmlrpc')
def accept_ride_request(trip, person):
        """
        This method is for a driver to accept a ride request by a rider.
        TODO:
        -verify user permissions
        """ 
        trip_dict = atom_to_dycapo(trip)
        person_dict = person
        
        trip = Trip.objects.get(id=trip_dict['id'])
        rider = Person.objects.get(username=person_dict['username'])
        
        rider_participation = Participation.objects.get(trip=trip,person=rider)
        if rider_participation.requested and not rider_participation.accepted:
                rider_participation.accepted = True
                rider_participation.accepted_timestamp = datetime.now()
                rider_participation.save()
                return True
        return False

        

@rpcmethod(name='dycapo.delete_trip', signature=['bool','Trip'], permission='server.can_xmlrpc')
def delete_trip(trip):
        """
        This method is only for testing. It will be removed in the final version of Dycapo!
        """
        trip_dict = atom_to_dycapo(trip)
        trip = Trip.objects.get(id=trip_dict['id'])
        for location in trip.locations.all():
                location.delete()
        trip.mode.delete()
        trip.prefs.delete()
        trip.participation.clear()
        trip.delete()
        return True
        