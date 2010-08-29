"""
   Copyright 2010 Daniel Graziotin <daniel.graziotin@acm.org>

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
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
        rider_distance_from_destination = rider.location.distance(destination)

        driver_distance_from_destination = trip.author.location.distance(
            destination)

        if driver_distance_from_destination < rider_distance_from_destination:
            trips = trips.exclude(id=trip.id)
            break

        if get_proximity_factor(trip.author, rider.location) < -2:
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
