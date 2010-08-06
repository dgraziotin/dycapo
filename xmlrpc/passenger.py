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
This module holds all the XML-RPC methods that a Rider needs.
"""
import datetime
import geopy
import server.matching as matching
import server.models as models
import response_codes
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
    .. _Prefs: http://www.dycapo.org/Protocol#Prefs
    .. _Location: http://www.dycapo.org/Protocol#Location
    .. _Response: http://www.dycapo.org/Protocol#Response

    RESTful proposals
    ===========================
    * missing
    """

    dict_destination = destination
    destination = models.Location()
    destination = utils.populate_object_from_dictionary(destination,
                                                        dict_destination)
    destination.complete_fields()

    dict_source = source
    source = models.Location()
    source = utils.populate_object_from_dictionary(source,
                                                        dict_source)
    destination.complete_fields()
    
    rider = utils.get_xmlrpc_user(kwargs)
    
    
    rider_active_participation = rider.get_active_participation()
    if rider_active_participation:
        resp = models.Response(response_codes.NEGATIVE,
                               response_codes.RIDE_IN_COURSE,
                               "Trip", rider_active_participation.trip.to_xmlrpc())
        return resp.to_xmlrpc()

    if rider.position.georss_point != source.georss_point:
        rider.position = source
        rider.position.save()
    
    trips = matching.search_ride(destination,rider)

    if not trips:
        return models.Response(response_codes.NEGATIVE,
                               response_codes.RIDES_NOT_FOUND,
                               "boolean", False).to_xmlrpc()

    return models.Response(response_codes.POSITIVE,
                           response_codes.RIDES_FOUND,
                           "Trip", [trip.to_xmlrpc() for trip in trips]).to_xmlrpc()

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
    .. _Prefs: http://www.dycapo.org/Protocol#Prefs
    .. _Location: http://www.dycapo.org/Protocol#Location
    .. _Response: http://www.dycapo.org/Protocol#Response
    
    RESTful proposals
    ===========================
    * POST https://domain.ext/trips/<id>/participations
    * POST https://domain.ext/trips/<id>/rides

    """

    trip_dict = trip
    rider = utils.get_xmlrpc_user(kwargs)
    rider_active_participation = rider.get_active_participation()
    
    if rider_active_participation:
        resp = models.Response(response_codes.NEGATIVE,
                               response_codes.RIDE_IN_COURSE,
                               "Trip", rider_active_participation.trip.to_xmlrpc())
        return resp.to_xmlrpc()
        
    try:
        trip = models.Trip.objects.filter(id=trip_dict['id']).only('id','participation').get()
    except (KeyError,models.Trip.DoesNotExist):
        resp = models.Response(response_codes.NEGATIVE,
                               response_codes.TRIP_NOT_FOUND,
                               "boolean", False)
        return resp.to_xmlrpc()


    participation = models.Participation(trip_id = trip.id,
                                         person_id = rider.id,
                                         role = 'rider',
                                         requested = True,
                                         requested_timestamp = 
                                         datetime.datetime.now())

    if rider.position:
        participation.requested_position_id = rider.position_id
    try:
        participation.save()
        resp = models.Response(response_codes.POSITIVE,
                               response_codes.RIDE_REQUESTED,
                               "boolean", True)
    except django.db.IntegrityError, e:
        resp = models.Response(response_codes.NEGATIVE,
                               str(e),
                               "boolean", False)
    return resp.to_xmlrpc()

@rpc4django.rpcmethod(name='dycapo.statusRide',
                      signature=['Response', 'Trip'],
                      permission='server.can_xmlrpc')
def statusRide(trip, ** kwargs):
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
    .. _Prefs: http://www.dycapo.org/Protocol#Prefs
    .. _Location: http://www.dycapo.org/Protocol#Location
    .. _Response: http://www.dycapo.org/Protocol#Response

    RESTful proposals
    ===========================
    * GET https://domain.ext/trips/<id>/participations/<username>
    * GET https://domain.ext/trips/<id>/rides/<username>
    """
    trip_dict = trip
    rider = utils.get_xmlrpc_user(kwargs)

    rider_active_participation = rider.get_active_participation()
    if rider_active_participation:
        resp = models.Response(response_codes.NEGATIVE,
                               response_codes.RIDE_IN_COURSE,
                               "Trip", rider_active_participation.trip.to_xmlrpc())
        return resp.to_xmlrpc()
    

    try:
        trip = models.Trip.objects.only('id','participation','author').get(
            id=trip_dict['id'])
        rider_participation = models.Participation.objects.get(trip=trip.id,
                                                               person=rider.id)
    except (KeyError,models.Trip.DoesNotExist):
        resp = models.Response(response_codes.NEGATIVE,
                               response_codes.TRIP_NOT_FOUND,
                               "boolean", False)
        return resp.to_xmlrpc()
        
    except models.Participation.DoesNotExist:
        resp = models.Response(response_codes.NEGATIVE,
                               response_codes.PERSON_NOT_FOUND,
                               "boolean", False)
    if rider_participation.accepted:
        
        resp = models.Response(response_codes.POSITIVE,
                               response_codes.RIDE_REQUEST_ACCEPTED,
                               "Person", trip.author.to_xmlrpc(position=True))
    else:
        resp = models.Response(response_codes.NEGATIVE,
                               response_codes.RIDE_REQUEST_NOT_YET_ACCEPTED,
                               "boolean", False)
    return resp.to_xmlrpc()

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
    .. _Prefs: http://www.dycapo.org/Protocol#Prefs
    .. _Location: http://www.dycapo.org/Protocol#Location
    .. _Response: http://www.dycapo.org/Protocol#Response
    
    RESTful proposals
    ===========================
    * PUT https://domain.ext/trips/<id>/participations/<username>
    * PUT https://domain.ext/trips/<id>/rides/<username>

    """

    trip_dict = trip
    rider = utils.get_xmlrpc_user(kwargs)


    try:
        trip = models.Trip.objects.only('id','participation').get(
            id=trip_dict['id'])
        rider_participation = models.Participation.objects.get(trip=trip.id,
                                                               person=rider.id)
    except (KeyError, models.Trip.DoesNotExist):
        resp = models.Response(response_codes.NEGATIVE,
                               response_codes.TRIP_NOT_FOUND,
                               "boolean", False)
        return resp.to_xmlrpc()
    except models.Participation.DoesNotExist:
        resp = models.Response(response_codes.NEGATIVE,
                    response_codes.MUST_FIRST_REQUEST_RIDE, "boolean", False)
        return resp.to_xmlrpc()

    rider_participation.requested_deleted = True
    rider_participation.requested_deleted_timestamp = datetime.datetime.now()

    if rider.position:
        rider_participation.requested_deleted_position_id = rider.position_id
    try:
        rider_participation.save()
        resp = models.Response(response_codes.POSITIVE,
                               response_codes.PERSON_DELETED_REQUESTED_RIDE,
                               "boolean", True)
    except django.db.IntegrityError, e:
        resp = models.Response(response_codes.NEGATIVE,
                               str(e),
                               "boolean", False)
    return resp.to_xmlrpc()

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
    .. _Prefs: http://www.dycapo.org/Protocol#Prefs
    .. _Location: http://www.dycapo.org/Protocol#Location
    .. _Response: http://www.dycapo.org/Protocol#Response

    RESTful proposals
    ===========================
    * PUT https://domain.ext/trips/<id>/participations/<username>
    * PUT https://domain.ext/trips/<id>/rides/<username>
        
    """

    trip_dict = trip
    rider = utils.get_xmlrpc_user(kwargs)

    try:
        trip = models.Trip.objects.only('id','participation').get(
            id=trip_dict['id'])
        is_already_participating = models.Participation.objects.filter(trip=trip, person=rider).exists()

        if not is_already_participating:
            resp = models.Response(response_codes.NEGATIVE,
                    response_codes.MUST_FIRST_REQUEST_RIDE, "boolean", False)
            return resp.to_xmlrpc()
    except (KeyError,models.Trip.DoesNotExist):
        resp = models.Response(response_codes.NEGATIVE,
                               response_codes.TRIP_NOT_FOUND,
                               "boolean", False)
        return resp.to_xmlrpc()

    try:
        participation = trip.get_participations().only('started',
                                                       'started_timestamp',
                                                       'started_position') \
                      .get(person=rider)
        participation.started = True
        participation.started_timestamp = datetime.datetime.now()
        participation.started_position_id = rider.position_id
        participation.save()
    except Exception, e:
        resp = models.Response(response_codes.NEGATIVE,
                               response_codes.TRIP_NOT_FOUND,
                               "boolean", False)
        return resp.to_xmlrpc()
    resp = models.Response(response_codes.POSITIVE,
                               response_codes.RIDE_STARTED,
                               "boolean", True)
    return resp.to_xmlrpc()

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
    .. _Prefs: http://www.dycapo.org/Protocol#Prefs
    .. _Location: http://www.dycapo.org/Protocol#Location
    .. _Response: http://www.dycapo.org/Protocol#Response

    RESTful proposals
    ===========================
    * PUT https://domain.ext/trips/<id>/participations/<username>
    * PUT https://domain.ext/trips/<id>/rides/<username>
    """

    trip_dict = trip
    rider = utils.get_xmlrpc_user(kwargs)

    try:
        trip = models.Trip.objects.only('id','participation').get(
            id=trip_dict['id'])
        is_already_participating = models.Participation.objects.filter(trip=trip, person=rider).exists()

        if not is_already_participating:
            resp = models.Response(response_codes.NEGATIVE,
                    response_codes.MUST_FIRST_REQUEST_RIDE, "boolean", False)
            return resp.to_xmlrpc()

    except (KeyError,models.Trips.DoesNotExist):
        resp = models.Response(response_codes.NEGATIVE,
                               response_codes.TRIP_NOT_FOUND,
                               "boolean", False)
        return resp.to_xmlrpc()

    participation = trip.get_participations().only('finished',
                                                   'finished_timestamp',
                                                   'finished_position') \
                  .get(person=rider)
    participation.finished = True
    participation.finished_timestamp = datetime.datetime.now()
    participation.finished_position_id = rider.position_id
    participation.save()
    resp = models.Response(response_codes.POSITIVE,
                               response_codes.RIDE_STARTED,
                               "boolean", True)
    return resp.to_xmlrpc()
