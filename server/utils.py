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
This module holds some utility functions.
"""
import settings
from copy import deepcopy
from models import Person, Response, Trip
import numpy
import geopy
from datetime import datetime, timedelta
from time import time

def now():
    now_seconds = time()
    now_date = datetime.fromtimestamp(now_seconds)
    return now_date.isoformat(' ')

def now_plus_days(num_days):
    now_seconds = time()
    now_date = datetime.fromtimestamp(now_seconds)
    nowplus = now_date + timedelta(days=num_days)
    return now_plus.isoformat(' ')

def now_minus_days(num_days):
    now_seconds = time()
    now_date = datetime.fromtimestamp(now_seconds)
    nowplus = now_date - timedelta(days=num_days)
    return now_minus.isoformat(' ')

def now_plus_minutes(num_minutes):
    now_seconds = time()
    now_date = datetime.fromtimestamp(now_seconds)
    nowplus = now_date + timedelta(minutes=num_minutes)
    return now_plus.isoformat(' ')

def now_minus_minutes(num_minutes):
    now_seconds = time()
    now_date = datetime.fromtimestamp(now_seconds)
    now_minus = now_date - timedelta(minutes=num_minutes)
    return now_minus.isoformat(' ')


def clean_ids(dictionary):
    if 'id' in dictionary.keys():
        del dictionary['id']
    return dictionary

def populate_object_from_dictionary(obj,dictionary):
        for key in dictionary:
            obj.__dict__[key] = dictionary[key]
        return obj

def synchronize_objects(old_obj,new_obj):
        for key in old_obj.__dict__:
                if key != 'id' and key!= '_state':
                        old_obj.__dict__[key] = new_obj.__dict__[key]
        return old_obj
                
def get_xmlrpc_user(kwargs):
    try:
        return Person.objects.get(username=kwargs['request'].META['REMOTE_USER'])
    except Person.DoesNotExist:
        return None

def check_vacancy(trip):
    trip.update_vacancy()
    return trip.has_vacancy

def exclude_trips_driver_closest_to_destination(trips,rider):
    for trip in trips:
        driver = trip.author
        destination = trip.get_destination()
        driver_distance_from_destination = driver.position.distance(destination)
        rider_distance_from_destination = rider.position.distance(destination)
        
        if driver_distance_from_destination < rider_distance_from_destination:
            trips = trips.exclude(id=trip.id)
            
    return trips

def exclude_trips_driver_not_approaching_rider(trips,rider):
    for trip in trips:
        driver = trip.author
        destination = trip.get_destination()
        if get_approaching_factor(trip.author,rider.position) < -2:
            trips = trips.exclude(id=trip.id)
            
    return trips


def get_approaching_factor(person,position):
    """
    Given a person and a location, it determines if the person is approaching it
    or getting away from it
    """
    recent_locations = person.get_recent_locations(10)
    recent_locations_distance_from_position = []
    for location in recent_locations:
        recent_locations_distance_from_position.append(location.distance(position))
    approaching_factor = location_approaching_factor(recent_locations_distance_from_position)
    return approaching_factor
    
def location_distance_factor(distance1, distance2):
    """
    Given two distances, returns 1 if the first distance is greater than the second one.
    Returns -1 if the first distance is less than the second one.
    Returns 0 if they are equal. 
    """
    if distance1 > distance2: return 1
    if distance1 < distance2: return -1
    return 0


def location_approaching_factor(distances):
    """
    Given a list of numbers, it computes the approaching factor which is a natural number in (-inf , +inf)
    If factor > 0, the numbers in list tend to decrease
    If factor == 0, the numbers in list tend to stay around the same value
    If factor < 0, the numbers in list tend to increase.
    
    In our case, we pass a list of distances from a location, in Kms, ordered by timestamp. If the function returns a number > 0, it means
    that the Person is approaching the location
    """
    factor = 0
    for i in range(0,len(distances)):
        if i==len(distances)-1: break
        factor += location_distance_factor(distances[i],distances[i+1])
    return factor


def get_trips_destination_near_location(location):
    lat_delta = 0.00265800000001
    lon_delta = 0.00818400000001
    lat_max = location.georss_point_latitude + lat_delta
    lat_min = location.georss_point_latitude - lat_delta
    lon_max = location.georss_point_longitude + lon_delta
    lon_min = location.georss_point_longitude - lon_delta

    trips_destination_near_location = Trip.objects.filter(
                    active=True,
                    locations__point='dest',
                    locations__georss_point_latitude__range=(lat_min,lat_max),
                    locations__georss_point_longitude__range=(lon_min,lon_max)
    )
    
    return trips_destination_near_location