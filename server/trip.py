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
from rpc4django import rpcmethod
from geopy import geocoders
from django.contrib.auth.models import User
from django.core import serializers
from models import Trip, Location, Person, Mode, Participation, Prefs
import settings

@rpcmethod(name='dycapo.add_trip', signature=['bool','Trip','Mode','Location','Location'], permission='auth.add_group')
def add_trip(trip, mode, source, destination):
        """
        Inserts a new Trip in Dycapo System. Right now it is possible to just create a Trip with a source and a
        destination. See the models.
        """
        dict_trip = trip
        dict_mode = mode
        dict_source= source
        dict_destination = destination
        
        driver = Person.objects.get(userid='driver1')
        
        source = Location()
        source = update(source,dict_source)
        source.save()
        
        destination = Location()
        destination = update(destination,dict_destination)
        destination.save()
        
        mode = Mode()
        mode = update(mode,dict_mode)
        mode.save()
        
        preferences = Prefs()
        preferences.age = "20"
        preferences.save()
        
        trip = Trip()
        trip = update(trip,dict_trip)
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
        
        return trip.for_xml_rpc()

@rpcmethod(name='dycapo.start_trip', signature=['bool','Trip'], permission='auth.add_group')
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
        
@rpcmethod(name='dycapo.search_trip', signature=['bool','Location','Location'], permission='auth.add_group')
def search_trip(source, destination):
        """
        This method will be used by a rider to search a Trip, given its current position and the destination.
        TODO:
        -verify user permissions
        -use serializers.serialize and use_natural_keys
        -implement an algorithm to really search a Trip
        """
        # at the moment we just return the first available trip
        trip = Trip.objects.get(id=1)
        return trip.to_xmlrpc()

@rpcmethod(name='dycapo.accept_trip', signature=['bool','Trip'], permission='auth.add_group')
def accept_trip(trip):
        """
        This method is for a rider to accept a proposed Trip.
        TODO:
        -verify user permissions
        -go through participation and set started = True
        -use serializers.serialize and use_natural_keys
        -implement an algorithm to really search a Trip
        """
        trip_dict = trip
        trip = Trip.objects.get(id=trip_dict['id'])
        rider = Person.objects.get(username='rider1')
        
        participation = Participation()
        participation.trip = trip
        participation.person = rider
        participation.role = 'rider'
        participation.save()
        
        return True

def update(obj,dictionary):
        for key in dictionary:
                obj.__dict__[key] = dictionary[key]
        if "Location" in str(obj.__class__ ):
                #return geopy_it(obj)
                return obj
        else:
                return obj

        

        