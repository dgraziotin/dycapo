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
This module holds all the XML-RPC methods that a driver and a rider have in common
"""
from rpc4django import rpcmethod
from models import Location, Person, Mode, Prefs, Trip, Response
from utils import populate_object_from_dictionary, get_xmlrpc_user
import response_codes
from django.db import IntegrityError
from django.core.exceptions import ValidationError


@rpcmethod(name='dycapo.update_position', signature=['Response','Location'], permission='server.can_xmlrpc')
def update_position(position,**kwargs):
    """
    This method is for updating the actual position of a Person.
        
    TODO
    
    - verify user permissions
    
    PARAMETERS
    
    - ``position`` - a **Location** object, representing the current position of a Person.
    
    RETURNS 
    
    An object of type **Response**, containing all the details of the operation and results (if any)
    """
    dict_position = position
    position = Location()
    position = populate_object_from_dictionary(position,dict_position)
    user = get_xmlrpc_user(kwargs)
    try:
        position.save()
    except Exception, e: 
        resp = Response(response_codes.NEGATIVE,str(e),"boolean",False)
        return resp.to_xmlrpc()
    
    user.position = position
    user.locations.add(position)
    user.save()
    resp = Response(response_codes.POSITIVE,response_codes.POSITION_UPDATED,"boolean",True)
    return resp.to_xmlrpc()

@rpcmethod(name='dycapo.get_position', signature=['Response','Person'], permission='server.can_xmlrpc')
def get_position(person):
    """
    This method is for getting the actual position of a Person.
        
    TODO
    
    - verify user permissions
    
    PARAMETERS
    
    - ``person`` - a **Person** object, representing the Person we would like to know the position.
    
    RETURNS 
    
    An object of type **Response**, containing all the details of the operation and results (if any)
    """
    dict_person = person
    try:
        person = Person.objects.get(username=person['username'])
    except Person.DoesNotExist:
        resp = Response(response_codes.ERROR,response_codes.PERSON_NOT_FOUND,'boolean',False)
        return resp.to_xmlrpc()
    
    if not person.position:
        resp = Response(response_codes.ERROR,response_codes.LOCATION_NOT_FOUND,'boolean',False)
        return resp.to_xmlrpc()
    else:
        resp = Response(response_codes.POSITIVE,response_codes.POSITION_FOUND,'Location',person.position.to_xmlrpc())
        return resp.to_xmlrpc()