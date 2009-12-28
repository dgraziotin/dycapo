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
from models import Trip, Location, Person, Mode, Participation, Prefs
import settings

@rpcmethod(name='dycapo.add_trip', signature=['bool','Trip','Mode','Location','Location'], permission='server.can_xmlrpc')
def add_trip(trip, mode, source, destination):
        """
        Inserts a new Trip in Dycapo System. It supports a source, a destination and
        the trip mode. See the models for more information.
        TODO:
        - Add trip preferences
        """
        dict_trip = trip
        dict_mode = mode
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
        
        # dummy Prefs object
        preferences = Prefs()
        preferences.age = "20"
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
        -go through participation and set started = True
        """
        trip_dict = trip
        trip = Trip.objects.get(id=trip_dict['id'])
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
        trips = Trip.objects.filter(active=True)
        """
        dummy algorithm: search in active Trips that have the same destination of the driver
        """
        if not trips:
                return False
        for trip in trips:
                for location in trip.locations.all():
                        if location.point=="dest" and location.georss_point==destination.georss_point:
                                return trip.to_xmlrpc()
        return False
        
@rpcmethod(name='dycapo.accept_trip', signature=['bool','Trip'], permission='server.can_xmlrpc')
def accept_trip(trip):
        """
        This method is for a rider to accept a proposed Trip.
        TODO:
        -verify user permissions
        -go through participation and set started = True
        -get rid of the exception thrown when the rider already participates in the Trip
        """
        trip_dict = trip
        trip = Trip.objects.get(id=trip['id'])
        rider = Person.objects.get(username='rider1')
        
        participation = Participation()
        participation.trip = trip
        participation.person = rider
        participation.role = 'rider'
        participation.save()
        
        return True

def populate_object(obj,dictionary):
        for key in dictionary:
                obj.__dict__[key] = dictionary[key]
        if "Location" in str(obj.__class__ ):
                #return geopy_it(obj)
                return obj
        else:
                return obj

        

        