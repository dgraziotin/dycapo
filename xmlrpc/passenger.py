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
This module holds all the XML-RPC methods that a passenger needs.
"""
import datetime
import geopy
import server.matching as matching
import server.models
import server.passenger
import server.response_codes
import rpc4django
import utils
import django.db


@rpc4django.rpcmethod(name='dycapo.searchRide',
                      signature=['Response', 'Location', 'Location'],
                      permission='server.can_xmlrpc')
def searchRide(source, destination, ** kwargs):
    """
    Description
    ===========

    Searches for a ride among all active Trips with vacancy.
    
    Authentication, Permissions
    ===========================
        * Authenticated Method
        * ``can_xmlrpc`` - active by default for all registered users

    Parameters
    ==========
    
        - ``source`` - a `Location <http://www.dycapo.org/Protocol#Location>`_ object,
          representing the current position of the passenger.
        - ``destination`` - a `Location <http://www.dycapo.org/Protocol#Location>`_ object,
          representing the destination that the passenger would like to reach
    
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
    | destination      | georss_point            | string                      |
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
    | False          | Either a suitable ride was not found or the parameters  |
    |                | are not valid or the passenger is already riding.       | 
    |                | Look at Response_.message for details                   |
    +----------------+---------------------------------------------------------+
    | trip_          | The operation was successful. The returned Trip is the  | 
    |                | one inserted including the id (Trip.id) to be used for  |
    |                | next operations and Trip.locations have more details    |
    |                | then those submitted as input                           |
    +----------------+---------------------------------------------------------+
    
    .. _Person: http://www.dycapo.org/Protocol#Person
    .. _Trip: http://www.dycapo.org/Protocol#Trip
    .. _Mode: http://www.dycapo.org/Protocol#Mode
    .. _Preferences: http://www.dycapo.org/Protocol#Preferences
    .. _Location: http://www.dycapo.org/Protocol#Location
    .. _Response: http://www.dycapo.org/Protocol#Response

    RESTful proposals
    ===========================
    * missing
    """

    dict_destination = destination
    destination = server.models.Location()
    destination = utils.populate_object_from_dictionary(destination,
                                                        dict_destination)
    destination.complete_fields()

    dict_source = source
    source = server.models.Location()
    source = utils.populate_object_from_dictionary(source,
                                                        dict_source)
    destination.complete_fields()
    
    passenger = utils.get_xmlrpc_user(kwargs)
    
    return server.passenger.searchRide(source, destination, passenger).to_xmlrpc()

@rpc4django.rpcmethod(name='dycapo.requestRide',
                      signature=['Response', 'Trip'],
                      permission='server.can_xmlrpc')
def requestRide(trip, ** kwargs):
    """
    Description
    ===========

    This is for requesting a ride.
    
    Authentication, Permissions
    ===========================
        * Authenticated Method
        * ``can_xmlrpc`` - active by default for all registered users

    Parameters
    ==========
    
        - ``trip`` - a `Trip <http://www.dycapo.org/Protocol#Trip>`_ object,
          representing the Trip that the Passenger would like to join
    
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
    | False          | Either the passenger is already riding or the supplied  |
    |                | parameters are not valid.                               |
    |                | Look at Response_.message for details                   |
    +----------------+---------------------------------------------------------+
    | True           | The operation was successful. The system stores the     |
    |                | request and will let the Driver discover it.            |
    |                | The next step is to use check_requested_ride()          |
    +----------------+---------------------------------------------------------+
    
    .. _Person: http://www.dycapo.org/Protocol#Person
    .. _Trip: http://www.dycapo.org/Protocol#Trip
    .. _Mode: http://www.dycapo.org/Protocol#Mode
    .. _Preferences: http://www.dycapo.org/Protocol#Preferences
    .. _Location: http://www.dycapo.org/Protocol#Location
    .. _Response: http://www.dycapo.org/Protocol#Response
    
    RESTful proposals
    ===========================
    * POST https://domain.ext/trips/<id>/participations
    * POST https://domain.ext/trips/<id>/rides

    """

    trip_dict = trip
    passenger = utils.get_xmlrpc_user(kwargs)
    try:
        trip = server.models.Trip.objects.filter(id=trip_dict['id']).only('id','participation').get()
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
    
    return server.passenger.requestRide(trip, passenger).to_xmlrpc()

@rpc4django.rpcmethod(name='dycapo.statusRequestedRide',
                      signature=['Response', 'Trip'],
                      permission='server.can_xmlrpc')
def statusRequestedRide(trip, ** kwargs):
    """
    Description
    ===========

    This method is for a passenger to check the status of his/her previously requested ride.
    
    Authentication, Permissions
    ===========================
        * Authenticated Method
        * ``can_xmlrpc`` - active by default for all registered users

    Parameters
    ==========
    
        - ``trip`` - a `Trip <http://www.dycapo.org/Protocol#Trip>`_ object,
          representing the Trip in which the passenger requested a ride.
    
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
    | False          | Either the passenger is already riding or the supplied  |
    |                | parameters are not valid.                               |
    |                | Look at Response_.message for details                   |
    +----------------+---------------------------------------------------------+
    | Person_        | The operation was successful. The Driver accepted the   |
    |                | request and the system logs the relevant information.   |
    |                | Look at Person_.username and Person_.position           |
    +----------------+---------------------------------------------------------+
    
    .. _Person: http://www.dycapo.org/Protocol#Person
    .. _Trip: http://www.dycapo.org/Protocol#Trip
    .. _Mode: http://www.dycapo.org/Protocol#Mode
    .. _Preferences: http://www.dycapo.org/Protocol#Preferences
    .. _Location: http://www.dycapo.org/Protocol#Location
    .. _Response: http://www.dycapo.org/Protocol#Response

    RESTful proposals
    ===========================
    * GET https://domain.ext/trips/<id>/participations/<username>
    * GET https://domain.ext/trips/<id>/rides/<username>
    """
    trip_dict = trip
    passenger = utils.get_xmlrpc_user(kwargs)

    try:
        trip = server.models.Trip.objects.only('id','participation','author').get(
            id=trip_dict['id'])
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
    
    return server.passenger.statusRide(trip, passenger).to_xmlrpc()

@rpc4django.rpcmethod(name='dycapo.cancelRide',
                      signature=['Response', 'Trip'],
                      permission='server.can_xmlrpc')
def cancelRide(trip, ** kwargs):
    """
    Description
    ===========

    This method is for a passenger to abort a ride request.
    
    Authentication, Permissions
    ===========================
        * Authenticated Method
        * ``can_xmlrpc`` - active by default for all registered users

    Parameters
    ==========
    
        - ``trip`` - a `Trip <http://www.dycapo.org/Protocol#Trip>`_ object,
          representing the Trip in which the passenger requested a ride.
    
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
    | False          | Either the passenger is not already riding or the       |
    |                | parameters are not valid.                               |
    |                | Look at Response_.message for details                   |
    +----------------+---------------------------------------------------------+
    | True           | The operation was successful. The system sets the       |
    |                | request as deleted. The Driver will also be informed    |
    +----------------+---------------------------------------------------------+
    
    .. _Person: http://www.dycapo.org/Protocol#Person
    .. _Trip: http://www.dycapo.org/Protocol#Trip
    .. _Mode: http://www.dycapo.org/Protocol#Mode
    .. _Preferences: http://www.dycapo.org/Protocol#Preferences
    .. _Location: http://www.dycapo.org/Protocol#Location
    .. _Response: http://www.dycapo.org/Protocol#Response
    
    RESTful proposals
    ===========================
    * PUT https://domain.ext/trips/<id>/participations/<username>
    * PUT https://domain.ext/trips/<id>/rides/<username>

    """
    trip_dict = trip
    passenger = utils.get_xmlrpc_user(kwargs)
   
    try:
        trip = server.models.Trip.objects.only('id','participation','author').get(
            id=trip_dict['id'])
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
    return server.passenger.cancelRide(trip, passenger).to_xmlrpc()

@rpc4django.rpcmethod(name='dycapo.startRide',
                      signature=['Response', 'Trip'],
                      permission='server.can_xmlrpc')
def startRide(trip, **kwargs):
    """
    Description
    ===========

    This method is for a passenger let the system know that the driver successfully arrived
    and picked him/her.
    
    Authentication, Permissions
    ===========================
        * Authenticated Method
        * ``can_xmlrpc`` - active by default for all registered users

    Parameters
    ==========
    
        - ``trip`` - a `Trip <http://www.dycapo.org/Protocol#Trip>`_ object,
          representing the Trip in which the passenger requested a ride.
    
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
    | False          | Either the passenger is not already riding or has not   |
    |                | requested the ride first or the                         |
    |                | parameters are not valid.                               |
    |                | Look at Response_.message for details                   |
    +----------------+---------------------------------------------------------+
    | True           | The operation was successful. The system sets the       |
    |                | ride as started.                                        |
    +----------------+---------------------------------------------------------+
    
    .. _Person: http://www.dycapo.org/Protocol#Person
    .. _Trip: http://www.dycapo.org/Protocol#Trip
    .. _Mode: http://www.dycapo.org/Protocol#Mode
    .. _Preferences: http://www.dycapo.org/Protocol#Preferences
    .. _Location: http://www.dycapo.org/Protocol#Location
    .. _Response: http://www.dycapo.org/Protocol#Response

    RESTful proposals
    ===========================
    * PUT https://domain.ext/trips/<id>/participations/<username>
    * PUT https://domain.ext/trips/<id>/rides/<username>
        
    """

    trip_dict = trip
    passenger = utils.get_xmlrpc_user(kwargs)

    try:
        trip = server.models.Trip.objects.only('id','participation').get(
            id=trip_dict['id'])
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
    
    return server.passenger.startRide(trip, passenger).to_xmlrpc()

@rpc4django.rpcmethod(name='dycapo.finishRide',
                      signature=['Response', 'Trip'],
                      permission='server.can_xmlrpc')
def finishRide(trip, **kwargs):
    """
    Description
    ===========

    This method is for a passenger to let the system know that 
    the ride has finished.
    
    Authentication, Permissions
    ===========================
        * Authenticated Method
        * ``can_xmlrpc`` - active by default for all registered users

    Parameters
    ==========
    
        - ``trip`` - a `Trip <http://www.dycapo.org/Protocol#Trip>`_ object,
          representing the Trip in which the passenger took a ride.
    
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
    | False          | Either the passenger did not participate in the Trip or |
    |                | the parameters are not valid.                           |
    |                | Look at Response_.message for details                   |
    +----------------+---------------------------------------------------------+
    | True           | The operation was successful. The system sets the       |
    |                | ride as finished and logs the information               |
    +----------------+---------------------------------------------------------+
    
    .. _Person: http://www.dycapo.org/Protocol#Person
    .. _Trip: http://www.dycapo.org/Protocol#Trip
    .. _Mode: http://www.dycapo.org/Protocol#Mode
    .. _Preferences: http://www.dycapo.org/Protocol#Preferences
    .. _Location: http://www.dycapo.org/Protocol#Location
    .. _Response: http://www.dycapo.org/Protocol#Response

    RESTful proposals
    ===========================
    * PUT https://domain.ext/trips/<id>/participations/<username>
    * PUT https://domain.ext/trips/<id>/rides/<username>
    """

    trip_dict = trip
    passenger = utils.get_xmlrpc_user(kwargs)

    try:
        trip = server.models.Trip.objects.only('id','participation','author').get(
            id=trip_dict['id'])
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
    
    return server.passenger.finishRide(trip, passenger).to_xmlrpc()