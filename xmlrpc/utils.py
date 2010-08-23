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
This module holds some utility functions.
"""

import time

import datetime
import server.models

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

def populate_object_from_dictionary(obj, dictionary):
    """
    Given an object and a dictionary, it updates all the object's
    attributes with name matching a key of the dictionary
    """
    obj.__dict__.update(dictionary)
    return obj

def get_location_from_array(locations, point="dest"):
    """
    Given a list of Location objects, it retrieves the one with specified point
    """
    for location in locations:
        if location["point"] == point:
            return location
    return none

def to_xmlrpc(response):
    """
    Utility function to extract Response.value in a clever way and call
    all objects' to_xmlrpc() methods.
    If Response.type is a server.models type, it simply calls the to_xmlrpc() method
    of the object contained in Response.value
    If Response.type is an array of a server.models type, it calls the to_xmlrpc()
    method of all of the objects in Response.value.
    """
    if response.type in server.models.__all__:
        response.value = response.value.to_xmlrpc()
    elif response.type.endswith('[]'):
        response.value = [entry.to_xmlrpc() for entry in response.value]
    return response.to_xmlrpc()



def get_xmlrpc_user(kwargs):
    """
    Returns the Person object that is performing an XML-RPC call
    """
    try:
        return server.models.Person.objects.get(
                                         username=kwargs['request'].META['REMOTE_USER']
                                         )
    except (server.models.Person.DoesNotExist, KeyError):
        return None
