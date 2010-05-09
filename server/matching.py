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
This module holds all the functions involved in the matching Algorithm of Dycapo
"""
import settings
from copy import deepcopy
from models import Person, Response, Trip
import numpy
import geopy
from datetime import datetime, timedelta
from time import time

def check_vacancy(trip):
    """
    Checks if the Trip has available seats
    """
    trip.update_vacancy()
    return trip.has_vacancy


def get_trips_destination_near_location(location):
    """
    Returns all the Trips with a destination near a given location.
    Here we create a virtual rectangle
    with base lon_delta * 2 and height and
    with height lat_delta * 2
    We query the database for all active Trips with a destination that is inside
    this rectangle, and return the QuerySet
    """
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

def exclude_trips_driver_closest_to_destination(trips,rider):
    """
    Given a QuerySet of Trips, this function removes all the Trips for which the
    driver is closer to the destination than the rider
    """
    for trip in trips:
        driver = trip.author
        destination = trip.get_destination()
        driver_distance_from_destination = driver.position.distance(destination)
        rider_distance_from_destination = rider.position.distance(destination)
        
        if driver_distance_from_destination < rider_distance_from_destination:
            trips = trips.exclude(id=trip.id)
            
    return trips

def exclude_trips_driver_not_approaching_rider(trips,rider):
    """
    The most complicated part of the matching algorithm. Given a QuerySet of Trips
    and a Person (the rider), it retrieves the approaching factor (defined later)
    and removes the Trip from the QuerySet if the factor is less than a decided number
    """
    for trip in trips:
        driver = trip.author
        if get_proximity_factor(trip.author,rider.position) < -2:
            trips = trips.exclude(id=trip.id)
            
    return trips


def get_proximity_factor(person,position):
    """
    Given a person and a location, it determines if the person is approaching it
    or getting away from it, by retrieving some recent locations of the person and
    computing their distance from the location. The set of ordered distances is then
    given to location_proximity_factor that retrives the factor
    """
    recent_locations = person.get_recent_locations(10)
    recent_locations_distance_from_position = []
    for location in recent_locations:
        recent_locations_distance_from_position.append(location.distance(position))
    proximity_factor = location_proximity_factor(recent_locations_distance_from_position)
    return proximity_factor
    
def location_proximity_factor(distances):
    """
    Given a list of distances, it computes the approaching factor which is a natural number in (-inf , +inf)
    If factor > 0, the numbers in list tend to decrease
    If factor == 0, the numbers in list tend to stay around the same value
    If factor < 0, the numbers in list tend to increase.
    """
    factor = 0
    for i in range(0,len(distances)):
        if i==len(distances)-1: break
        factor += location_distance_factor(distances[i],distances[i+1])
    return factor

def location_distance_factor(distance1, distance2):
    """
    Given two distances, returns 1 if the first distance is greater than the second one.
    Returns -1 if the first distance is less than the second one.
    Returns 0 if they are equal. 
    """
    if distance1 > distance2: return 1
    if distance1 < distance2: return -1
    return 0

