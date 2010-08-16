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

    Updates the current position of the logged current_user.

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
    .. _Preferences: http://www.dycapo.org/Protocol#Preferences
    .. _Location: http://www.dycapo.org/Protocol#Location
    .. _Response: http://www.dycapo.org/Protocol#Response

    RESTful proposals
    ===========================
    * POST https://domain.ext/persons/<username>/position

    """
    dict_position = position
    position = server.models.Location()
    position = utils.populate_object_from_dictionary(position, dict_position)
    current_user = utils.get_xmlrpc_user(kwargs)

    response = server.common.setPosition(current_user, position)
    return utils.to_xmlrpc(response)

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
        * The requesting current_user must participate in a Trip with the person he/she wants
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
    .. _Preferences: http://www.dycapo.org/Protocol#Preferences
    .. _Location: http://www.dycapo.org/Protocol#Location
    .. _Response: http://www.dycapo.org/Protocol#Response

    RESTful proposals
    ===========================
    * GET https://domain.ext/persons/<username>/position
    """

    current_user = utils.get_xmlrpc_user(kwargs)
    try:
        person = server.models.Person.objects.get(username=person['username'])
    except (KeyError, server.models.Person.DoesNotExist):
        resp = server.models.Response(server.models.response.NOT_FOUND, 'Message', server.models.Message(server.models.response.PERSON_NOT_FOUND))
        return utils.to_xmlrpc(response)

    response = server.common.getPosition(current_user, person)
    return utils.to_xmlrpc(response)

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
        * Authenticated Method, can be used only by current_user ``register`` with password ``password``
        * ``can_register`` - active only for current_user ``register``
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
    .. _Preferences: http://www.dycapo.org/Protocol#Preferences
    .. _Location: http://www.dycapo.org/Protocol#Location
    .. _Response: http://www.dycapo.org/Protocol#Response

    RESTful proposals
    ===========================
    * POST https://domain.ext/persons

    """
    person_dict = person
    try:
        person = server.models.Person(**person)
    except TypeError, e:
        resp = models.Response(server.models.response.NOT_FOUND,
                               'Message', models.Message(str(e)))
        return resp
    response = server.common.register(person)
    return utils.to_xmlrpc(response)


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
        * The requesting current_user must be the same of the supplied Person.

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
    .. _Preferences: http://www.dycapo.org/Protocol#Preferences
    .. _Location: http://www.dycapo.org/Protocol#Location
    .. _Response: http://www.dycapo.org/Protocol#Response

    RESTful proposals
    ===========================
    * PUT https://domain.ext/persons/<username>
    """
    person_dict = person
    current_user = utils.get_xmlrpc_user(kwargs)
    try:
        current_user.password = person_dict['password']
    except KeyError:
        return utils.to_xmlrpc(server.models.response.BAD_REQUEST,
                            'Message',
                               server.models.Message(server.models.response.PROTOCOL_ERROR))
    response = server.common.changePassword(current_user)
    return utils.to_xmlrpc(response)
