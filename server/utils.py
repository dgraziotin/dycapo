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
        
                