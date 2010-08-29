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

import piston.utils
import server.models
import django.core.urlresolvers
import django.db.models.query

def get_rc_from_code(status_code):
    """
    Conversion method. Given a Response status code, it retrieves
    the corresponding piston rc object, returning it
    """
    for key in piston.utils.rc.CODES.keys():
        if piston.utils.rc.CODES[key][1] == status_code:
            rc = eval('piston.utils.rc.'+key)
            rc.content = ''
            return rc
    return None

def extract_result_from_response(response):
    """
    Given a Response object, if status code != 200,
    it retrieves the corresponding piston rc object
    and converts a Response object to a RESTful
    object
    """
    if response.code != server.models.Response.ALL_OK:
        result = get_rc_from_code(response.code)
        if response.value:
            result.write(response.value)
    else:
        result = response.value
    return result

def get_rest_user(request):
    """
    Returns the Person object that is performing a REST call
    """
    try:
        return server.models.Person.objects.get(
                                         username=request.META['REMOTE_USER']
                                         )
    except (server.models.Person.DoesNotExist, KeyError):
        return None

def clean_ids(dictionary):
    """
    Removes attributes with key 'id' from dictionaries. Suitable for XML-RPC
    returns
    """
    try:
        del dictionary['id']
    except KeyError:
        pass
    return dictionary


def get_location_from_array(locations, point="dest"):
    """
    Given a list of Location objects, it retrieves the one with specified point
    """
    for location in locations:
        if location["point"] == point:
            return location
    return none

def populate_object_from_dictionary(obj, dictionary):
    """
    Given an object and a dictionary, it updates all the object's
    attributes with name matching a key of the dictionary
    """
    obj.__dict__.update(dictionary)
    return obj

def synchronize_objects(old_obj, new_obj):
    """
    Synchronizes attributes values of two objects
    """
    for key in old_obj.__dict__:
        if key != 'id' and key != '_state' and key not in old_obj.cannot_update and new_obj.__dict__[key]:
            old_obj.__dict__[key] = new_obj.__dict__[key]
    return old_obj

def get_href(request, handler, args=None):
    return request.build_absolute_uri(django.core.urlresolvers.reverse(handler,args=args))
