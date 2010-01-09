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
This is a temporany file that holds all the XML-RPC exported functions.
It will surely splitted in a future time.
"""
from rpc4django import rpcmethod
from geopy import geocoders
from django.contrib.auth.models import User
from django.core import serializers
from django.db import IntegrityError
from models import Trip, Location, Person, Mode, Participation, Prefs
from datetime import datetime
import settings
from copy import deepcopy
@rpcmethod(name='dycapo.add_trip', signature=['bool','Trip','Mode','Prefs','Location','Location'], permission='server.can_xmlrpc')
def add_trip(trip, mode, preferences, source, destination):
        """
        Inserts a new Trip in Dycapo System. It supports a source, a destination and
        the trip mode. See the models for more information.
        TODO:
        - Add trip preferences
        """
        dict_trip = trip
        dict_mode = mode
        dict_prefs = preferences
        dict_source= source
        dict_destination = destination
        
        # we just use driver1 as driver right now. We must wait for rpc4django to inflate
        # a User object in the functions for using the real driver
        driver = Person.objects.get(userid='driver1')
        
        source = Location()
        source = populate_object(source,dict_source)
        source.save()
        
        destination = Location()
        destination = populate_object(destination,dict_destination)
        destination.save()
        
        mode = Mode()
        mode = populate_object(mode,dict_mode)
        mode.save()
        
        preferences = Prefs()
        preferences = populate_object(preferences,dict_prefs)
        preferences.save()
        
        trip = Trip()
        trip = populate_object(trip,dict_trip)
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
        
@rpcmethod(name='dycapo.search_trip', signature=['bool','Location','Location'], permission='server.can_xmlrpc')
def search_trip(source, destination):
        """
        This method will be used by a rider to search a Trip, given its current position and the destination.
        TODO:
        -verify user permissions
        -use serializers.serialize and use_natural_keys
        -implement an algorithm to really search a Trip
        """
        dict_destination = destination
        destination = Location()
        destination = populate_object(destination,dict_destination)
        # at the moment we just return the first available trips that are also active
        trips = Trip.objects.all()
        """
        dummy algorithm: search in active Trips that have the same destination of the driver
        """
        
        if not trips:
                return False
        for trip in trips:
                for location in trip.locations.filter(point="dest"):
                        if location.georss_point==destination.georss_point:
                                return trip.to_xmlrpc()
        return False
        
        
@rpcmethod(name='dycapo.accept_trip', signature=['bool','Trip'], permission='server.can_xmlrpc')
def accept_trip(trip):
        """
        This method is for a rider to accept a proposed Trip.
        TODO:
        -verify user permissions
        """
        trip_dict = atom_to_dycapo(trip)
        trip = Trip.objects.get(id=trip_dict['id'])
        rider = Person.objects.get(username='rider1')
        
        participation = Participation()
        participation.trip = trip
        participation.person = rider
        participation.role = 'rider'
        participation.ride_requested = True
        participation.ride_requested_timestamp = datetime.now()
        try:
                participation_check = Participation.objects.get(trip=trip,person=rider)
                participation_check = synchronize_objects(participation_check,participation)
                participation_check.save()
        except Participation.DoesNotExist:
                participation.save()
        return True

@rpcmethod(name='dycapo.check_ride_requests', signature=['bool','Trip'], permission='server.can_xmlrpc')
def check_ride_requests(trip):
        """
        This method is for a driver to see if there are ride requests for his Trip
        TODO:
        -verify user permissions
        """
        trip_dict = atom_to_dycapo(trip)

        trip = Trip.objects.get(id=trip_dict['id'])
        driver = Person.objects.get(username='driver1')

        participations_for_trip = Participation.objects.filter(trip=trip).exclude(person=driver)

        if len(participations_for_trip) == 0:
                return False
        else:
                for participation in participations_for_trip:
                        if participation.ride_requested:
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
        driver = Person.objects.get(username='driver1')
        rider = Person.objects.get(username=person_dict['username'])
        
        rider_participation = Participation.objects.get(trip=trip,person=rider)
        if rider_participation.ride_requested and not rider_participation.ride_accepted:
                rider_participation.ride_accepted = True
                rider_participation.ride_accepted_timestamp = datetime.now()
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

def get_atom_id_from_dycapo_id(id):
        """
        Converts a Dycapo Id to an Atom Id
        """
        return "urn:guid:"+settings.SITE_DOMAIN+":"+str(id)
    
def get_dycapo_id_from_atom_id(atom_id):
        """
        Converts an Atom Id to a Dycapo Id
        """
        splitted_atom_id = atom_id.split(':')
        dycapo_id = int(splitted_atom_id[-1])
        return dycapo_id

def atom_to_dycapo(dictionary):
        """
        Searches for a id key in a dictionary and converts it to a Dycapo internal Id
        """
        dycapo_dictionary = deepcopy(dictionary)
        try:
                dycapo_dictionary['id'] = get_dycapo_id_from_atom_id(dictionary['id'])
                return dycapo_dictionary
        except KeyError:
                return dycapo_dictionary

def populate_object(obj,dictionary):
        for key in dictionary:
                obj.__dict__[key] = dictionary[key]
        if "Trip" in str(obj.__class__ ):
                try:
                        obj.id = get_dycapo_id_from_atom_id(dictionary['id'])
                except KeyError:
                        return obj
                return obj        
        if "Location" in str(obj.__class__ ):
                #return geopy_it(obj)
                return obj
        else:
                return obj

def synchronize_objects(old_obj,new_obj):
        for key in old_obj.__dict__:
                if key != 'id' and key!= '_state':
                        old_obj.__dict__[key] = new_obj.__dict__[key]
        return old_obj
                
                