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
import models
import response_codes
import rpc4django
import utils

def insertTrip(trip, author, source, destination, mode, preferences):

    vacancy = mode.vacancy
    mode, created = models.Mode.objects.get_or_create(person=author,
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
        return resp

    trip.author = author
    trip.mode = mode
    trip.prefs = preferences


    try:
        trip.save()
    except Exception, e:
        resp = models.Response(response_codes.NEGATIVE, str(e), "boolean",
                               False)
        return resp

    trip.locations.add(source)
    trip.locations.add(destination)

    participation = models.Participation(person=author, trip=trip,
                                         role='driver')
    participation.save()

    resp = models.Response(response_codes.POSITIVE,
                           response_codes.TRIP_INSERTED, "Trip",
                           trip.to_xmlrpc())

    return resp

def startTrip(trip, driver):
    
    participation = models.Participation.objects.get(trip=trip.id, role='driver')

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
    return resp

def getRides(trip, driver):
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
        return resp
    else:
        participations = [participation.person.to_xmlrpc()
                          for participation in participations_for_trip]
        resp = models.Response(response_codes.POSITIVE,
                               response_codes.RIDE_REQUESTS_FOUND,
                               "Person[]", participations)
        return resp


def acceptRide(trip, driver, passenger):
    try:
        passenger_participation = models.Participation.objects.get(trip=trip.id,
                                                               person=passenger.id)
    except models.Participation.DoesNotExist:
        resp = models.Response(response_codes.NEGATIVE,
                               response_codes.PERSON_NOT_FOUND,
                               "boolean", False)
        return resp
    if passenger_participation.requested and not passenger_participation.accepted:
        passenger_participation.accepted = True
        passenger_participation.accepted_timestamp = datetime.datetime.now()
        try:
            passenger_participation.accepted_position_id = passenger.position_id
        except models.Location.DoesNotExist:
            passenger_participation.accepted_position = None

        passenger_participation.save()
        resp = models.Response(response_codes.POSITIVE,
                               response_codes.RIDE_REQUEST_ACCEPTED,
                               "boolean", True)
        return resp
    
    resp = models.Response(response_codes.NEGATIVE,
                           response_codes.RIDE_REQUEST_REFUSED,
                           "boolean", False)
    return resp


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

    try:
        trip = models.Trip.objects.only("id").get(id=trip_dict['id'])
    except (KeyError, models.Trip.DoesNotExist):
        resp = models.Response(response_codes.NEGATIVE,
                               response_codes.TRIP_NOT_FOUND,
                               "boolean", False)
        return resp.to_xmlrpc()

    try:
        passenger = models.Person.objects.only("id","position").get(
            username=person_dict['username'])
    except (KeyError, models.Person.DoesNotExist):
        resp = models.Response(response_codes.NEGATIVE,
                               response_codes.PERSON_NOT_FOUND,
                               "boolean", False)
        return resp.to_xmlrpc()

    try:
        passenger_participation = models.Participation.objects.get(trip=trip.id,
                                                               person=passenger.id)
    except models.Participation.DoesNotExist:
        resp = models.Response(response_codes.NEGATIVE,
                           response_codes.PERSON_NOT_FOUND,
                           "boolean", False)
        return resp.to_xmlrpc()


    passenger_participation.refused = True
    passenger_participation.refused_timestamp = datetime.datetime.now()
    try:
        passenger_participation.refused_position_id = passenger.position_id
    except models.Location.DoesNotExist:
        passenger_participation.accepted_position = None

    passenger_participation.save()
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

    RESTful proposals
    ===========================
    * PUT https://domain.ext/trips/<id>
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


