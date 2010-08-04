"""
This module holds all the XML-RPC methods that a Driver needs.
"""
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
import datetime
import models
import response_codes
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

    """

    dict_trip = utils.clean_ids(trip)
    dict_mode = utils.clean_ids(trip["content"]["mode"])
    dict_prefs = utils.clean_ids(trip["content"]["prefs"])
    array_locations = trip["content"]["locations"]

    driver = utils.get_xmlrpc_user(kwargs)

    source = models.Location()
    dict_source = utils.get_location_from_array(array_locations,"orig")
    source = utils.populate_object_from_dictionary(source, dict_source)


    destination = models.Location()
    dict_destination = utils.get_location_from_array(array_locations,"dest")
    destination = utils.populate_object_from_dictionary(destination, dict_destination)

    mode = models.Mode()
    mode = utils.populate_object_from_dictionary(mode, dict_mode)
    vacancy = dict_mode['vacancy']
    preferences = models.Prefs()
    preferences = utils.populate_object_from_dictionary(preferences, dict_prefs)

    mode, created = models.Mode.objects.get_or_create(person=driver,
                                                 make=mode.make,
                                                 model=mode.model,
                                                 capacity=mode.capacity,
                                                 kind=mode.kind)
    mode.vacancy = vacancy

    try:
        source.save()
        destination.save()
        mode.save()
        preferences.save()
    except Exception, e:
        resp = models.Response(response_codes.NEGATIVE, str(e), "boolean",
                               False)
        return resp.to_xmlrpc()

    trip = models.Trip()
    trip = utils.populate_object_from_dictionary(trip, dict_trip)
    trip.author = driver
    trip.mode = mode
    trip.prefs = preferences


    try:
        trip.save()
    except Exception, e:
        resp = models.Response(response_codes.NEGATIVE, str(e), "boolean",
                               False)
        return resp.to_xmlrpc()

    trip.locations.add(source)
    trip.locations.add(destination)

    participation = models.Participation(person=driver, trip=trip,
                                         role='driver')
    participation.save()

    resp = models.Response(response_codes.POSITIVE,
                           response_codes.TRIP_INSERTED, "Trip",
                           trip.to_xmlrpc())

    return resp.to_xmlrpc()

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

    """

    trip_dict = trip
    try:
        trip = models.Trip.objects.only("id","active").get(id=trip_dict['id'])
    except (KeyError, models.Trip.DoesNotExist):
        resp = models.Response(response_codes.NEGATIVE,
                               response_codes.TRIP_NOT_FOUND,
                               "boolean", False)
        return resp.to_xmlrpc()


    participation = models.Participation.objects.get(trip=trip.id, role='driver')
    driver = utils.get_xmlrpc_user(kwargs)

    if participation.started:
        resp = models.Response(response_codes.NEGATIVE,
                               response_codes.TRIP_ALREADY_STARTED,
                               "boolean", False)
        return resp.to_xmlrpc()

    participation.started = True
    participation.started_timestamp = datetime.datetime.now()
    try:
        participation.started_position_id = driver.position_id
    except models.Location.DoesNotExist:
        participation.started_position = None
    participation.save()
    trip.active = True
    trip.save()

    resp = models.Response(response_codes.POSITIVE,
                           response_codes.TRIP_STARTED, "boolean", True)
    return resp.to_xmlrpc()


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

    """

    trip_dict = trip

    try:
        trip = models.Trip.objects.only("id").get(id=trip_dict['id'])
    except (KeyError,models.Trip.DoesNotExist):
        resp = models.Response(response_codes.NEGATIVE,
                               response_codes.TRIP_NOT_FOUND,
                               "Trip", trip_dict)
        return resp.to_xmlrpc()

    driver = utils.get_xmlrpc_user(kwargs)

    participations_for_trip = (models.Participation.objects.filter(trip=trip.id)
                               .exclude(person=driver)
                               .filter(started=False)
                               .filter(finished=False)
                               .filter(requested=True)
                               .filter(requested_deleted=False)
                               ).only("person")

    if not len(participations_for_trip):
        resp = models.Response(response_codes.NEGATIVE,
                               response_codes.RIDE_REQUESTS_NOT_FOUND,
                               "boolean", False)
        return resp.to_xmlrpc()
    else:
        participations = [participation.person.to_xmlrpc()
                          for participation in participations_for_trip]
        resp = models.Response(response_codes.POSITIVE,
                               response_codes.RIDE_REQUESTS_FOUND,
                               "Person[]", participations)
        return resp.to_xmlrpc()


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
    | False          | Either the ``id`` attributes are missing or not 
    |                | not valid.                                              |
    |                | Look at Response_.message for further details.          |
    +----------------+---------------------------------------------------------+
    | True           | The operation was successful. Dycapo stores the request |
    |                | as accepted by the Driver.                              |
    +----------------+---------------------------------------------------------+
    
    .. _Trip: http://www.dycapo.org/Protocol#Trip
    .. _Response: http://www.dycapo.org/Protocol#Response
    .. _Person: http://www.dycapo.org/Protocol#Person
    """

    trip_dict = trip
    person_dict = person

    try:
        trip = models.Trip.objects.only("id").get(id=trip_dict['id'])
    except (KeyError, models.Trip.DoesNotExist):
        resp = models.Response(response_codes.NEGATIVE,
                               response_codes.TRIP_NOT_FOUND,
                               "boolean", False)
        return resp.to_xmlrpc()

    try:
        rider = models.Person.objects.only("id","position").get(
            username=person_dict['username'])
    except (KeyError, models.Person.DoesNotExist):
        resp = models.Response(response_codes.NEGATIVE,
                               response_codes.PERSON_NOT_FOUND,
                               "boolean", False)
        return resp.to_xmlrpc()

    try:
        rider_participation = models.Participation.objects.get(trip=trip.id,
                                                               person=rider.id)
    except models.Participation.DoesNotExist:
        resp = models.Response(response_codes.NEGATIVE,
                               response_codes.PERSON_NOT_FOUND,
                               "boolean", False)
        return resp.to_xmlrpc()
    if rider_participation.requested and not rider_participation.accepted:
        rider_participation.accepted = True
        rider_participation.accepted_timestamp = datetime.datetime.now()
        try:
            rider_participation.accepted_position_id = rider.position_id
        except models.Location.DoesNotExist:
            rider_participation.accepted_position = None

        rider_participation.save()
        resp = models.Response(response_codes.POSITIVE,
                               response_codes.RIDE_REQUEST_ACCEPTED,
                               "boolean", True)
        return resp.to_xmlrpc()

    resp = models.Response(response_codes.NEGATIVE,
                           response_codes.RIDE_REQUEST_REFUSED,
                           "boolean", False)
    return resp.to_xmlrpc()


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

    """    
    trip_dict = trip
    person_dict = person

    try:
        trip = models.Trip.objects.only("id").get(id=trip_dict['id'])
    except (KeyError, models.Trip.DoesNotExist):
        resp = models.Response(response_codes.NEGATIVE,
                               response_codes.TRIP_NOT_FOUND,
                               "boolean", False)
        return resp.to_xmlrpc()

    try:
        rider = models.Person.objects.only("id","position").get(
            username=person_dict['username'])
    except (KeyError, models.Person.DoesNotExist):
        resp = models.Response(response_codes.NEGATIVE,
                               response_codes.PERSON_NOT_FOUND,
                               "boolean", False)
        return resp.to_xmlrpc()

    try:
        rider_participation = models.Participation.objects.get(trip=trip.id,
                                                               person=rider.id)
    except models.Participation.DoesNotExist:
        resp = models.Response(response_codes.NEGATIVE,
                           response_codes.PERSON_NOT_FOUND,
                           "boolean", False)
        return resp.to_xmlrpc()


    rider_participation.refused = True
    rider_participation.refused_timestamp = datetime.datetime.now()
    try:
        rider_participation.refused_position_id = rider.position_id
    except models.Location.DoesNotExist:
        rider_participation.accepted_position = None

    rider_participation.save()
    resp = models.Response(response_codes.POSITIVE,
                               response_codes.RIDE_REQUEST_REFUSED,
                               "boolean", True)
    return resp.to_xmlrpc()




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

    """

    
    trip_dict = trip
    try:
        trip = models.Trip.objects.get(id=trip_dict['id'])
    except (KeyError, models.Trip.DoesNotExist):
        resp = models.Response(response_codes.NEGATIVE,
                           response_codes.TRIP_NOT_FOUND,
                           "boolean", False)
        return resp.to_xmlrpc()
    driver = utils.get_xmlrpc_user(kwargs)
    
    if driver.is_participating():
        participation = driver.get_active_participation()
        participation.finished = True
        participation.finished_timestamp = utils.now()
        participation.save()
    trip.active = False
    trip.save()

    resp = models.Response(response_codes.POSITIVE,
                           response_codes.TRIP_DELETED,
                           "boolean", True)
    return resp.to_xmlrpc()


