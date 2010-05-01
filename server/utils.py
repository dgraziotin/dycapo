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
from models import Person, Response

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

def get_persons_near(position,user):
    
    # around 300meters, computed empirically
    lat_delta = 0.00265800000001
    lon_delta = 0.00818400000001
    
    person_lat_max = position.georss_point_latitude + lat_delta
    person_lat_min = position.georss_point_latitude - lat_delta
    person_lon_max = position.georss_point_longitude + lon_delta
    person_lon_min = position.georss_point_longitude - lon_delta
    
    persons_near = (Person.objects
                    .filter(position__georss_point_latitude__range=(person_lat_min,person_lat_max))
                    .filter(position__georss_point_longitude__range=(person_lon_min,person_lon_max))
                    .exclude(username=user.username))
    return persons_near

def get_trips_similar_destination(destination):
    lat_delta = 0.00265800000001
    lon_delta = 0.00818400000001
    lat_max = destination.georss_point_latitude + lat_delta
    lat_min = destination.georss_point_latitude - lat_delta
    lon_max = destination.georss_point_longitude + lon_delta
    lon_min = destination.georss_point_longitude - lon_delta

    trips = Trip.objects.filter(
                    active=True,
                    locations__point='dest',
                    locations__georss_point_latitude__range=(lat_min,lat_max),
                    locations__georss_point_longitude__range=(lon_min,lon_max)
            )