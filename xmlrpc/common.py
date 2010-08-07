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

""" This module holds all the XML-RPC methods that a driver
and a rider have in common """

import server.models
import server.common
import response_codes
import rpc4django
import utils
import django.contrib.auth.models

@rpc4django.rpcmethod(name='dycapo.setPosition',
                      signature=['Response', 'Location'],
                      permission='server.can_xmlrpc')
def setPosition(position, ** kwargs):
    """
    Description
    ===========

    Updates the current position of the logged user.
    
    Authentication, Permissions
    ===========================
        * Authenticated Method
        * ``can_xmlrpc`` - active by default for all registered users

    Parameters
    ==========
    
        - ``position`` - a `Location <http://www.dycapo.org/Protocol#Location>`_ object,
          representing the current position of the passenger.
    
    Required Parameters Details
    ---------------------------
    
    +------------------+-------------------------+-----------------------------+
    | Object           | Object's Attribute      | Object's Attribute Type     |
    +==================+=========================+=============================+
    | source           | georss_point            | string                      |
    +------------------+-------------------------+-----------------------------+
    |                  | street                  | string                      |
    +------------------+-------------------------+-----------------------------+
    |                  | town                    | string                      |
    +------------------+-------------------------+-----------------------------+
    |                  | postcode                | int                         |
    +------------------+-------------------------+-----------------------------+
    |                  | point                   | string                      |
    +------------------+-------------------------+-----------------------------+
    |                  | leaves                  | dateTime.iso8601            |
    +------------------+-------------------------+-----------------------------+
    
    - Either ``georss_point`` OR all from set { ``street``, ``town``, ``postcode`` } MUST be specified
    - ``point`` value MUST be any from the set {orig, dest, wayp, posi}.
    - See Location_ for more details

    Response Possible Return Values
    -------------------------------
    
    +----------------+---------------------------------------------------------+
    | Response_.value|   Details                                               |
    +================+=========================================================+
    | False          | The supplied attributes are not valid.                  | 
    |                | Look at Response_.message for details                   |
    +----------------+---------------------------------------------------------+
    | True           | The operation was successful. The system stores the     |
    |                | provided position for the user.                         |
    +----------------+---------------------------------------------------------+
    
    .. _Person: http://www.dycapo.org/Protocol#Person
    .. _Trip: http://www.dycapo.org/Protocol#Trip
    .. _Mode: http://www.dycapo.org/Protocol#Mode
    .. _Prefs: http://www.dycapo.org/Protocol#Prefs
    .. _Location: http://www.dycapo.org/Protocol#Location
    .. _Response: http://www.dycapo.org/Protocol#Response
    
    RESTful proposals
    ===========================
    * POST https://domain.ext/persons/<username>/position

    """
    dict_position = position
    position = server.models.Location()
    position = utils.populate_object_from_dictionary(position, dict_position)
    user = utils.get_xmlrpc_user(kwargs)
    
    return server.common.setPosition(position, user).to_xmlrpc()

@rpc4django.rpcmethod(name='dycapo.getPosition',
                      signature=['Response', 'Person'],
                      permission='server.can_xmlrpc')
def getPosition(person, **kwargs):
    """
    Description
    ===========

    Returns the position of the requested Person.
    
    Authentication, Permissions
    ===========================
        * Authenticated Method
        * ``can_xmlrpc`` - active by default for all registered users
        * The requesting user must participate in a Trip with the person he/she wants
        to know the position of.

    Parameters
    ==========
    
        - ``Location`` - a `Location <http://www.dycapo.org/Protocol#Location>`_ object,
          representing the current position of the Person.
    
    Required Parameters Details
    ---------------------------
    
    +------------------+-------------------------+-----------------------------+
    | Object           | Object's Attribute      | Object's Attribute Type     |
    +==================+=========================+=============================+
    | person_          | username                | string                      |
    +------------------+-------------------------+-----------------------------+

    Response Possible Return Values
    -------------------------------
    
    +----------------+---------------------------------------------------------+
    | Response_.value|   Details                                               |
    +================+=========================================================+
    | False          | Either the supplied attributes are not valid or the user|
    |                | does not have the rights to know Person's position.     |
    |                | Look at Response_.message for details                   |
    +----------------+---------------------------------------------------------+
    | Location_      | The operation was successful. The system returns the    |
    |                | current position of the user.                           |
    +----------------+---------------------------------------------------------+
    
    .. _Person: http://www.dycapo.org/Protocol#Person
    .. _Trip: http://www.dycapo.org/Protocol#Trip
    .. _Mode: http://www.dycapo.org/Protocol#Mode
    .. _Prefs: http://www.dycapo.org/Protocol#Prefs
    .. _Location: http://www.dycapo.org/Protocol#Location
    .. _Response: http://www.dycapo.org/Protocol#Response

    RESTful proposals
    ===========================
    * GET https://domain.ext/persons/<username>/position
    """

    user = utils.get_xmlrpc_user(kwargs)
    try:
        person = server.models.Person.objects.get(username=person['username'])
    except (KeyError, models.Person.DoesNotExist):
        resp = models.Response(response_codes.NEGATIVE,
                               response_codes.PERSON_NOT_FOUND, 'boolean', False)
        return resp.to_xmlrpc()
    
    return server.common.getPosition(user,person).to_xmlrpc()

@rpc4django.rpcmethod(name='dycapo.register',
                      signature=['Response', 'Person'],
                      permission='server.can_register')
def register(person):
    """
    Description
    ===========

    For registering a user to Dycapo system.
    
    Authentication, Permissions
    ===========================
        * Authenticated Method, can be used only by user ``register`` with password ``password``
        * ``can_register`` - active only for user ``register``
        * All of this is because of Apache's HTTP_BASIC_AUTH implementation

    Parameters
    ==========
    
        - ``person`` - a `Person <http://www.dycapo.org/Protocol#Person>`_ object,
          representing the person that is registering to the system.
    
    Required Parameters Details
    ---------------------------
    
    +------------------+-------------------------+-----------------------------+
    | Object           | Object's Attribute      | Object's Attribute Type     |
    +==================+=========================+=============================+
    | person_          | username                | string                      |
    +------------------+-------------------------+-----------------------------+
    |                  | password                | string                      |
    +------------------+-------------------------+-----------------------------+
    |                  | email                   | string                      |
    +------------------+-------------------------+-----------------------------+
    |                  | phone                   | string                      |
    +------------------+-------------------------+-----------------------------+
    

    Response Possible Return Values
    -------------------------------
    
    +----------------+---------------------------------------------------------+
    | Response_.value|   Details                                               |
    +================+=========================================================+
    | False          | Either the supplied attributes are not valid or the user|
    |                | is already registered to the system.                    |
    |                | Look at Response_.message for details                   |
    +----------------+---------------------------------------------------------+
    | True           | The operation was successful. The system registers the  |
    |                | user, that is automatically allowed to perform RPC calls|
    +----------------+---------------------------------------------------------+
    
    .. _Person: http://www.dycapo.org/Protocol#Person
    .. _Trip: http://www.dycapo.org/Protocol#Trip
    .. _Mode: http://www.dycapo.org/Protocol#Mode
    .. _Prefs: http://www.dycapo.org/Protocol#Prefs
    .. _Location: http://www.dycapo.org/Protocol#Location
    .. _Response: http://www.dycapo.org/Protocol#Response

    RESTful proposals
    ===========================
    * POST https://domain.ext/persons
        
    """
    person_dict = person
    try:
        person = server.models.Person.objects.get(username=person_dict['username'])
    except server.models.Person.DoesNotExist:
        person = models.Person(**person)
        person.set_password(person.password)
        return server.common.register(person).to_xmlrpc()
    
    resp = models.Response(response_codes.NEGATIVE,
                               response_codes.PERSON_ALREADY_REGISTERED, 'boolean',
                               False)
    return resp


@rpc4django.rpcmethod(name='dycapo.changePassword',
                      signature=['Response', 'Person'],
                      permission='server.can_xmlrpc')
def changePassword(person, **kwargs):
    """
    Description
    ===========

    For changing the password of a Person.
    
    Authentication, Permissions
    ===========================
        * Authenticated Method
        * ``can_xmlrpc`` - active by default for all registered users
        * The requesting user must be the same of the supplied Person.
        
    Parameters
    ==========
    
        - ``person`` - a `Person <http://www.dycapo.org/Protocol#Person>`_ object,
          representing the person that is changing the password.
    
    Required Parameters Details
    ---------------------------
    
    +------------------+-------------------------+-----------------------------+
    | Object           | Object's Attribute      | Object's Attribute Type     |
    +==================+=========================+=============================+
    | person_          | username                | string                      |
    +------------------+-------------------------+-----------------------------+
    |                  | password                | string                      |
    +------------------+-------------------------+-----------------------------+

    

    Response Possible Return Values
    -------------------------------
    
    +----------------+---------------------------------------------------------+
    | Response_.value|   Details                                               |
    +================+=========================================================+
    | False          | Either the supplied attributes are not valid or the user|
    |                | is not allowed to change the password (e.g., it is      |
    |                | trying to change another person's password)             |
    |                | Look at Response_.message for details                   |
    +----------------+---------------------------------------------------------+
    | True           | The operation was successful. The system changes the    |
    |                | password, that must be used from now on.                |
    +----------------+---------------------------------------------------------+
    
    .. _Person: http://www.dycapo.org/Protocol#Person
    .. _Trip: http://www.dycapo.org/Protocol#Trip
    .. _Mode: http://www.dycapo.org/Protocol#Mode
    .. _Prefs: http://www.dycapo.org/Protocol#Prefs
    .. _Location: http://www.dycapo.org/Protocol#Location
    .. _Response: http://www.dycapo.org/Protocol#Response

    RESTful proposals
    ===========================
    * PUT https://domain.ext/persons/<username>
    """
    person_dict = person
    user = utils.get_xmlrpc_user(kwargs)
    try:
        user.password = person_dict['password']
    except KeyError:
        return models.Response(response_codes.NEGATIVE,
                               response_codes.PERSON_NOT_FOUND, 'boolean',
                               False).to_xmlrpc()
    return server.common.changePassword(user).to_xmlrpc()