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
This module holds all the XML-RPC methods that a Driver needs.
"""
import datetime
import server.models
import server.driver
import server.response_codes
import rpc4django
import utils

@rpc4django.rpcmethod(name='dycapo.insertTrip',
                      signature=['Response', 'Trip'],
                      permission='server.can_xmlrpc')
def insertTrip(trip, ** kwargs):
    """
    Description
    ===========
    
    Inserts a new Trip in Dycapo System. This method does **not** start the
    Trip. use ``start_trip(Trip trip)`` for this scope.

    Authentication, Permissions
    ===========================
        * Authenticated Method
        * ``can_xmlrpc`` - active by default for all registered users

    Parameters
    ==========
    
        - ``trip`` - a `Trip <http://www.dycapo.org/Protocol#Trip>`_ object,
          representing the Trip that the Driver is saving in Dycapo

    
    Required Parameters Details
    ---------------------------
    
    +------------------+-------------------------+-----------------------------+
    | Object           | Object's Attribute      | Object's Attribute Type     |
    +==================+=========================+=============================+
    | trip_            | published               | dateTime.iso8601            |
    +------------------+-------------------------+-----------------------------+
    |                  | author                  | struct (Person_)            |
    +------------------+-------------------------+-----------------------------+
    |                  | expires                 | dateTime.iso8601            |
    +------------------+-------------------------+-----------------------------+
    |                  | content                 | struct (Many)              |
    +------------------+-------------------------+-----------------------------+
    | trip_.content    | mode                    | struct (Mode_)              |
    +------------------+-------------------------+-----------------------------+
    |                  | prefs                   | struct (Prefs_)             |
    +------------------+-------------------------+-----------------------------+
    |                  | locations               | array (Location_)           |
    +------------------+-------------------------+-----------------------------+

    Response Possible Return Values
    -------------------------------
    
    +----------------+---------------------------------------------------------+
    | Response_.value|   Details                                               |
    +================+=========================================================+
    | False          | Something was wrong, look at Response_.message          | 
    |                | for details                                             |
    +----------------+---------------------------------------------------------+
    | trip_          | The operation was successful. The returned Trip is the  | 
    |                | one inserted including the id (Trip.id) to be used for  |
    |                | next operations and Trip.locations have more details    |
    |                | then those submitted as input                           |
    +----------------+---------------------------------------------------------+
    
    .. _Person: http://www.dycapo.org/Protocol#Person
    .. _Trip: http://www.dycapo.org/Protocol#Trip
    .. _Mode: http://www.dycapo.org/Protocol#Mode
    .. _Prefs: http://www.dycapo.org/Protocol#Prefs
    .. _Location: http://www.dycapo.org/Protocol#Location
    .. _Response: http://www.dycapo.org/Protocol#Response
    
    RESTful proposals
    ===========================
    * POST https://domain.ext/trips/

    """

    dict_trip = utils.clean_ids(trip)
    dict_mode = utils.clean_ids(trip["content"]["mode"])
    dict_prefs = utils.clean_ids(trip["content"]["prefs"])
    array_locations = trip["content"]["locations"]

    author = utils.get_xmlrpc_user(kwargs)

    source = server.models.Location()
    dict_source = utils.get_location_from_array(array_locations,"orig")
    source = utils.populate_object_from_dictionary(source, dict_source)


    destination = server.models.Location()
    dict_destination = utils.get_location_from_array(array_locations,"dest")
    destination = utils.populate_object_from_dictionary(destination, dict_destination)

    mode = server.models.Mode()
    mode = utils.populate_object_from_dictionary(mode, dict_mode)
    mode.vacancy = dict_mode['vacancy']
    
    preferences = server.models.Prefs()
    preferences = utils.populate_object_from_dictionary(preferences, dict_prefs)
    
    trip = server.models.Trip()
    trip = utils.populate_object_from_dictionary(trip, dict_trip)
    
    return server.driver.insertTrip(trip, author, source, destination, mode, preferences).to_xmlrpc()

@rpc4django.rpcmethod(name='dycapo.startTrip',
                      signature=['Response', 'Trip'],
                      permission='server.can_xmlrpc')
def startTrip(trip, ** kwargs):
    """
    Description
    ===========
    
    Starts a Trip previously saved.

    Authentication, Permissions
    ===========================
        * Authenticated Method
        * ``can_xmlrpc`` - active by default for all registered users

    Parameters
    ==========
    
        - ``trip`` - a `Trip <http://www.dycapo.org/Protocol#Trip>`_ object,
          representing the Trip that the Driver is saving in Dycapo

    
    Required Parameters Details
    ---------------------------
    
    +------------------+-------------------------+-----------------------------+
    | Object           | Object's Attribute      | Object's Attribute Type     |
    +==================+=========================+=============================+
    | trip_            | id                      | int                         |
    +------------------+-------------------------+-----------------------------+


    Response Possible Return Values
    -------------------------------
    
    +----------------+---------------------------------------------------------+
    | Response_.value|   Details                                               |
    +================+=========================================================+
    | False          | Either the ``id`` attribute is missing or not not valid.|
    |                | The trip could also be already started.                 |
    |                | Look at Response_.message for further details.          |
    +----------------+---------------------------------------------------------+
    | True           | The operation successfully completed. The trip is       |
    |                | set as started in the system and is available for       |
    |                | search by passengers                                    |
    +----------------+---------------------------------------------------------+
    
    .. _Response: http://www.dycapo.org/Protocol#Response
    
    RESTful proposals
    ===========================
    * PUT https://domain.ext/trips/<id>

    """

    trip_dict = trip
    driver = utils.get_xmlrpc_user(kwargs)
    try:
        trip = server.models.Trip.objects.only("id","active").get(id=trip_dict['id'],author=driver)
    except server.models.Trip.DoesNotExist:
        resp = server.models.Response(server.response_codes.NOT_FOUND,
                               server.response_codes.TRIP_NOT_FOUND,
                               "boolean", False)
        return resp.to_xmlrpc()
    except KeyError:
        resp = server.models.Response(server.response_codes.BAD_REQUEST,
                               server.response_codes.PROTOCOL_ERROR,
                               "boolean", False)
        return resp.to_xmlrpc()
    
    return server.driver.startTrip(trip, driver).to_xmlrpc()

@rpc4django.rpcmethod(name='dycapo.getRides',
                      signature=['Response', 'Trip'],
                      permission='server.can_xmlrpc')
def getRides(trip, ** kwargs):
    """
    Description
    ===========
    
    This method is for a Driver to see if there are any ride requests
    from potential passengers.

    Authentication, Permissions
    ===========================
        * Authenticated Method
        * ``can_xmlrpc`` - active by default for all registered users

    Parameters
    ==========
    
        - ``trip`` - a `Trip <http://www.dycapo.org/Protocol#Trip>`_ object,
          representing the Trip that the Driver is saving in Dycapo

    
    Required Parameters Details
    ---------------------------
    
    +------------------+-------------------------+-----------------------------+
    | Object           | Object's Attribute      | Object's Attribute Type     |
    +==================+=========================+=============================+
    | trip_            | id                      | int                         |
    +------------------+-------------------------+-----------------------------+


    Response Possible Return Values
    -------------------------------
    
    +----------------+---------------------------------------------------------+
    | Response_.value|   Details                                               |
    +================+=========================================================+
    | False          | Either the ``id`` attribute is missing or not not valid.|
    |                | Also, there could be not requests.                      |
    |                | Look at Response_.message for further details.          |
    +----------------+---------------------------------------------------------+
    | Person_ []     | Note that this is an array, not a single object.        |
    |                | Every Person object supplied contains at least          |
    |                | the ``username`` attribute                              |
    +----------------+---------------------------------------------------------+
    
    .. _Trip: http://www.dycapo.org/Protocol#Trip
    .. _Response: http://www.dycapo.org/Protocol#Response
    .. _Person: http://www.dycapo.org/Protocol#Person

    RESTful proposals
    ===========================
    * GET https://domain.ext/trips/rides
    * GET https://domain.ext/trips/participations
    """

    trip_dict = trip
    driver = utils.get_xmlrpc_user(kwargs)
    try:
        trip = server.models.Trip.objects.only("id","active").get(id=trip_dict['id'],author=driver)
    except server.models.Trip.DoesNotExist:
        resp = server.models.Response(server.response_codes.NOT_FOUND,
                               server.response_codes.TRIP_NOT_FOUND,
                               "boolean", False)
        return resp.to_xmlrpc()
    except KeyError:
        resp = server.models.Response(server.response_codes.BAD_REQUEST,
                               server.response_codes.PROTOCOL_ERROR,
                               "boolean", False)
        return resp.to_xmlrpc()

    return server.driver.getRides(trip, driver).to_xmlrpc()

@rpc4django.rpcmethod(name='dycapo.acceptRide',
                      signature=['Response', 'Trip', 'Person'],
                      permission='server.can_xmlrpc')
def acceptRide(trip, person, ** kwargs):
    """
    Description
    ===========
    
    This method is for a Driver to accept a Passenger request.

    Authentication, Permissions
    ===========================
        * Authenticated Method
        * ``can_xmlrpc`` - active by default for all registered users

    Parameters
    ==========
    
        - ``trip`` - a `Trip <http://www.dycapo.org/Protocol#Trip>`_ object,
          representing the Trip that the Driver is referring to
        - ``person`` - a `Person <http://www.dycapo.org/Protocol#Person>`_ object,
          representing the passenger that the driver is accepting

    
    Required Parameters Details
    ---------------------------
    
    +------------------+-------------------------+-----------------------------+
    | Object           | Object's Attribute      | Object's Attribute Type     |
    +==================+=========================+=============================+
    | trip_            | id                      | int                         |
    +------------------+-------------------------+-----------------------------+
    | person_          | username                | string                      |
    +------------------+-------------------------+-----------------------------+


    Response Possible Return Values
    -------------------------------
    
    +----------------+---------------------------------------------------------+
    | Response_.value|   Details                                               |
    +================+=========================================================+
    | False          | Either the ``id`` attributes are missing or not         |
    |                | not valid.                                              |
    |                | Look at Response_.message for further details.          |
    +----------------+---------------------------------------------------------+
    | True           | The operation was successful. Dycapo stores the request |
    |                | as accepted by the Driver.                              |
    +----------------+---------------------------------------------------------+
    
    .. _Trip: http://www.dycapo.org/Protocol#Trip
    .. _Response: http://www.dycapo.org/Protocol#Response
    .. _Person: http://www.dycapo.org/Protocol#Person
    
    RESTful proposals
    ===========================
    * PUT https://domain.ext/trips/<id>/participations/<username>
    * PUT https://domain.ext/trips/<id>/rides/<username>
    """

    trip_dict = trip
    person_dict = person
    driver = utils.get_xmlrpc_user(kwargs)

    try:
        trip = server.models.Trip.objects.only("id","active").get(id=trip_dict['id'],author=driver)
    except server.models.Trip.DoesNotExist:
        resp = server.models.Response(server.response_codes.NOT_FOUND,
                               server.response_codes.TRIP_NOT_FOUND,
                               "boolean", False)
        return resp.to_xmlrpc()
    except KeyError:
        resp = server.models.Response(server.response_codes.BAD_REQUEST,
                               server.response_codes.PROTOCOL_ERROR,
                               "boolean", False)
        return resp.to_xmlrpc()

    try:
        passenger = server.models.Person.objects.only("id","position").get(
            username=person_dict['username'])
    except server.models.Person.DoesNotExist:
        resp = server.models.Response(server.response_codes.NOT_FOUND,
                               server.response_codes.TRIP_NOT_FOUND,
                               "boolean", False)
        return resp.to_xmlrpc()
    except KeyError:
        resp = server.models.Response(server.response_codes.BAD_REQUEST,
                               server.response_codes.PROTOCOL_ERROR,
                               "boolean", False)
        return resp.to_xmlrpc()
    
    
    return server.driver.acceptRide(trip, driver, passenger)


@rpc4django.rpcmethod(name='dycapo.refuseRide',
                      signature=['Response', 'Trip', 'Person'],
                      permission='server.can_xmlrpc')
def refuseRide(trip, person, ** kwargs):
    """
    Description
    ===========
    
    This method is for a Driver to refuse a Passenger request.

    Authentication, Permissions
    ===========================
        * Authenticated Method
        * ``can_xmlrpc`` - active by default for all registered users

    Parameters
    ==========
    
        - ``trip`` - a `Trip <http://www.dycapo.org/Protocol#Trip>`_ object,
          representing the Trip that the Driver is referring to.
        - ``person`` - a `Person <http://www.dycapo.org/Protocol#Person>`_ object,
          representing the passenger that the driver is refusing

    
    Required Parameters Details
    ---------------------------
    
    +------------------+-------------------------+-----------------------------+
    | Object           | Object's Attribute      | Object's Attribute Type     |
    +==================+=========================+=============================+
    | trip_            | id                      | int                         |
    +------------------+-------------------------+-----------------------------+
    | person_          | username                | string                      |
    +------------------+-------------------------+-----------------------------+


    Response Possible Return Values
    -------------------------------
    
    +----------------+---------------------------------------------------------+
    | Response_.value|   Details                                               |
    +================+=========================================================+
    | False          | Either the ``id`` attributes are missing or not         |
    |                | not valid.                                              |
    |                | Look at Response_.message for further details.          |
    +----------------+---------------------------------------------------------+
    | True           | The operation was successful. Dycapo stores the request |
    |                | as refused by the Driver.                               |
    +----------------+---------------------------------------------------------+
    
    .. _Trip: http://www.dycapo.org/Protocol#Trip
    .. _Response: http://www.dycapo.org/Protocol#Response
    .. _Person: http://www.dycapo.org/Protocol#Person

    RESTful proposals
    ===========================
    * PUT https://domain.ext/trips/<id>/participations/<username>
    * PUT https://domain.ext/trips/<id>/rides/<username>
    """    
    trip_dict = trip
    person_dict = person
    driver = utils.get_xmlrpc_user(kwargs)
    try:
        trip = server.models.Trip.objects.only("id","active").get(id=trip_dict['id'],author=driver)
    except server.models.Trip.DoesNotExist:
        resp = server.models.Response(server.response_codes.NOT_FOUND,
                               server.response_codes.TRIP_NOT_FOUND,
                               "boolean", False)
        return resp.to_xmlrpc()
    except KeyError:
        resp = server.models.Response(server.response_codes.BAD_REQUEST,
                               server.response_codes.PROTOCOL_ERROR,
                               "boolean", False)
        return resp.to_xmlrpc()

    try:
        passenger = server.models.Person.objects.only("id","position").get(
            username=person_dict['username'])
    except server.models.Person.DoesNotExist:
        resp = server.models.Response(server.response_codes.NOT_FOUND,
                               server.response_codes.TRIP_NOT_FOUND,
                               "boolean", False)
        return resp.to_xmlrpc()
    except KeyError:
        resp = server.models.Response(server.response_codes.BAD_REQUEST,
                               server.response_codes.PROTOCOL_ERROR,
                               "boolean", False)
        return resp.to_xmlrpc()

    return server.driver.refuseRide(trip, passenger)



@rpc4django.rpcmethod(name='dycapo.finishTrip',
                      signature=['Response', 'Trip'],
                      permission='server.can_xmlrpc')
def finishTrip(trip, ** kwargs):
    """
    Description
    ===========
    
    This method is for a Driver to set a trip as finished.

    Authentication, Permissions
    ===========================
        * Authenticated Method
        * ``can_xmlrpc`` - active by default for all registered users

    Parameters
    ==========
    
        - ``trip`` - a `Trip <http://www.dycapo.org/Protocol#Trip>`_ object,
          representing the Trip that the Driver is closing.

    
    Required Parameters Details
    ---------------------------
    
    +------------------+-------------------------+-----------------------------+
    | Object           | Object's Attribute      | Object's Attribute Type     |
    +==================+=========================+=============================+
    | trip_            | id                      | int                         |
    +------------------+-------------------------+-----------------------------+


    Response Possible Return Values
    -------------------------------
    
    +----------------+---------------------------------------------------------+
    | Response_.value|   Details                                               |
    +================+=========================================================+
    | False          | Either the ``id`` attribute is missing or               | 
    |                | not valid.                                              |
    |                | Look at Response_.message for further details.          |
    +----------------+---------------------------------------------------------+
    | True           | The operation was successful. Dycapo stores the Trip    |
    |                | as finished.                                            |
    +----------------+---------------------------------------------------------+
    
    .. _Trip: http://www.dycapo.org/Protocol#Trip
    .. _Response: http://www.dycapo.org/Protocol#Response
    .. _Person: http://www.dycapo.org/Protocol#Person

    RESTful proposals
    ===========================
    * PUT https://domain.ext/trips/<id>
    """

    driver = utils.get_xmlrpc_user(kwargs)
    trip_dict = trip
    try:
        trip = server.models.Trip.objects.only("id","active").get(id=trip_dict['id'],author=driver)
    except server.models.Trip.DoesNotExist:
        resp = server.models.Response(server.response_codes.NOT_FOUND,
                               server.response_codes.TRIP_NOT_FOUND,
                               "boolean", False)
        return resp.to_xmlrpc()
    except KeyError:
        resp = server.models.Response(server.response_codes.BAD_REQUEST,
                               server.response_codes.PROTOCOL_ERROR,
                               "boolean", False)
        return resp.to_xmlrpc()
    
    driver = utils.get_xmlrpc_user(kwargs)
    return server.driver.finishTrip(trip, driver).to_xmlrpc()

