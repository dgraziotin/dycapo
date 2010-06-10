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
import models

def search_ride(location,rider):
    """
    Returns all the Trips with a destination near a given location.
    Here we create a virtual box around the destination.
    [See Location.get_box_around()]
    We query the database for all active Trips with a destination that is inside
    this box, and return the QuerySet
    """

    box_around_location = location.get_box_around()
    lat_max = max((box_around_location[0].georss_point_latitude, 
                   box_around_location[1].georss_point_latitude))
    lat_min = min((box_around_location[3].georss_point_latitude, 
                   box_around_location[2].georss_point_latitude))

    lon_max = max((box_around_location[1].georss_point_longitude,
                   box_around_location[2].georss_point_longitude))
    lon_min = min((box_around_location[0].georss_point_longitude,
                   box_around_location[3].georss_point_longitude))

    trips = models.Trip.objects.filter(
        active=True,
        locations__point='dest',
        locations__georss_point_latitude__range=(lat_min, lat_max),
        locations__georss_point_longitude__range=(lon_min, lon_max),
    ).only("id","author","locations")

    for trip in trips:

        if not trip.has_vacancy():
            trips = trips.exclude(id=trip.id)
            break

        destination = trip.get_destination()
        rider_distance_from_destination = rider.position.distance(destination)

        driver_distance_from_destination = trip.author.position.distance(
            destination)

        if driver_distance_from_destination < rider_distance_from_destination:
            trips = trips.exclude(id=trip.id)
            break

        if get_proximity_factor(trip.author, rider.position) < -2:
            trips = trips.exclude(id=trip.id)
            break

    return trips


def get_proximity_factor(person, position):
    """
    Given a person and a location, it determines if the person is approaching it
    or getting away from it, by retrieving some recent locations of the person and
    computing their distance from the location. The set of ordered distances is then
    given to location_proximity_factor that retrives the factor
    """
    recent_locations = person.get_recent_locations(10)
    recent_locations_distance_from_position = [location.distance(position)
                                               for location in recent_locations
                                               ]
    proximity_factor = location_proximity_factor(
                            recent_locations_distance_from_position)
    return proximity_factor

def location_proximity_factor(distances):
    """
    Given a list of distances, it computes the approaching factor which
    is a natural number in (-inf , +inf)
    If factor > 0, the numbers in list tend to decrease
    If factor == 0, the numbers in list tend to stay around the same value
    If factor < 0, the numbers in list tend to increase.
    """
    return sum([cmp(distances[i], distances[i + 1])
                 for i in xrange(len(distances)-1)])


#def location_distance_factor(distance1, distance2):
    #"""
    #Given two distances, returns 1 if the first distance is greater than
    #the second one.
    #Returns -1 if the first distance is less than the second one.
    #Returns 0 if they are equal.
    #"""
    #if distance1 > distance2: return 1
    #if distance1 < distance2: return -1
    #return 0
