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
This module holds all the XML-RPC methods that a Rider needs.
"""
from rpc4django import rpcmethod
from models import Trip, Location, Person, Participation
from datetime import datetime
from utils import atom_to_dycapo, populate_object_from_dictionary, synchronize_objects, get_user

@rpcmethod(name='dycapo.search_trip', signature=['bool','Location','Location'], permission='server.can_xmlrpc')
def search_trip(source, destination):
        """
        This method will be used by a rider to search a Trip, given its current position and the destination.
        TODO:
        -verify user permissions
        -use serializers.serialize and use_natural_keys
        -implement an algorithm to really search a Trip :)
        """
        dict_destination = destination
        destination = Location()
        destination = populate_object_from_dictionary(destination,dict_destination)
        # at the moment we just return the first available trips that are also active
        trips = Trip.objects.filter(active=True)
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
        
        
@rpcmethod(name='dycapo.request_ride', signature=['bool','Trip'], permission='server.can_xmlrpc')
def request_ride(trip, **kwargs):
        """
        This method is for a rider to request a Ride in a Trip.
        TODO:
        -verify user permissions
        -check if there is vacancy in the current trip
        -check if the trip is not expired
        """
        trip_dict = atom_to_dycapo(trip)
        trip = Trip.objects.get(id=trip_dict['id'])
        rider = get_user(kwargs)
        
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