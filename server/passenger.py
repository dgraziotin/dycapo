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
This module holds all the methods that a passenger needs.
"""
import datetime
import matching
import models
import django.db


def searchRide(source, destination, passenger):
    """
    Given a source, a destination and the passenger, it searches for
    a suitable ride.
    """
    passenger_active_participation = passenger.get_active_participation()
    if passenger_active_participation:
        resp = models.Response(models.Response.FORBIDDEN,
                               "Trip", passenger_active_participation.trip)
        return resp

    if passenger.location.georss_point != source.georss_point:
        passenger.location = source
        try:
            passenger.location.full_clean()
        except django.core.exceptions.ValidationError, e:
            resp = models.Response(models.Response.BAD_REQUEST,
                               "Message", e)
            return resp
        passenger.location.save()

    trips = matching.search_ride(destination,passenger)

    if not trips:
        return models.Response(models.Response.NOT_FOUND,
                               "Message", models.Response.RIDES_NOT_FOUND)

    return models.Response(models.Response.ALL_OK,
                           "Trip[]", trips)

def requestRide(trip, passenger):
    """
    Sends a request for a ride to the Trip author
    """
    passenger_active_participation = passenger.get_active_participation()

    if passenger_active_participation:
        resp = models.Response(models.Response.FORBIDDEN,
                               "Trip", passenger_active_participation.trip)
        return resp

    participation = models.Participation(trip_id = trip.id,
                                         person_id = passenger.id,
                                         role = 'rider',
                                         requested = True,
                                         requested_timestamp =
                                         datetime.datetime.now())

    if passenger.location:
        participation.requested_position_id = passenger.location_id
    try:
        participation.save()
        resp = models.Response(models.Response.CREATED,
                               "Message", models.Response.RIDE_REQUESTED)
    except django.db.IntegrityError, e:
        resp = models.Response(models.Response.BAD_REQUEST,
                               "Message", e)
    return resp

def statusRide(trip, passenger):
    """
    Sends a request for a ride to the Trip author
    """
    passenger_active_participation = passenger.get_active_participation()
    if passenger_active_participation:
        resp = models.Response(models.Response.FORBIDDEN,
                               "Trip", passenger_active_participation.trip)
        return resp


    try:
        passenger_participation = models.Participation.objects.get(trip=trip.id,
                                                               person=passenger.id)
    except models.Participation.DoesNotExist:
        resp = models.Response(models.Response.NOT_FOUND,
                               "Message", models.Response.PERSON_NOT_FOUND)

    if passenger_participation.accepted:
        resp = models.Response(models.Response.ALL_OK,
                               "Person", trip.author)
    else:
        resp = models.Response(models.Response.NOT_FOUND,
                               "Message", models.Response.RIDE_REQUEST_NOT_YET_ACCEPTED)
    return resp


def cancelRide(trip, passenger):
    """
    Deletes a ride previously requested
    """
    try:
        passenger_participation = models.Participation.objects.get(trip=trip.id,
                                                               person=passenger.id)
    except models.Participation.DoesNotExist:
        resp = models.Response(models.Response.NOT_FOUND,
                    "Message", models.Response.MUST_FIRST_REQUEST_RIDE)
        return resp

    passenger_participation.requested_deleted = True
    passenger_participation.requested_deleted_timestamp = datetime.datetime.now()

    if passenger.location:
        passenger_participation.requested_deleted_position_id = passenger.location_id
    try:
        passenger_participation.save()
        resp = models.Response(models.Response.DELETED,
                               "Message", models.Response.PERSON_DELETED_REQUESTED_RIDE)
    except django.db.IntegrityError, e:
        resp = models.Response(models.Response.BAD_REQUEST,
                               "Message", e)
    return resp

def startRide(trip, passenger):
    """
    Let the system know that a ride succesfully started, i.e. the Driver
    has arrived to pick the passenger
    """
    try:
        is_already_participating = models.Participation.objects.filter(trip=trip, person=passenger).exists()

        if not is_already_participating:
            resp = models.Response(models.Response.NOT_FOUND,
                    "Message", models.Response.MUST_FIRST_REQUEST_RIDE)
            return resp
    except (KeyError,models.Participation.DoesNotExist):
        resp = models.Response(models.Response.NOT_FOUND,
                               "Message", models.Response.TRIP_NOT_FOUND)
        return resp

    try:
        participation = trip.get_participations().only('started',
                                                       'started_timestamp',
                                                       'started_position') \
                      .get(person=passenger)
        participation.started = True
        participation.started_timestamp = datetime.datetime.now()
        participation.started_position_id = passenger.location_id
        participation.save()
    except Exception, e:
        resp = models.Response(models.Response.BAD_REQUEST,
                               "Message", e)
        return resp
    resp = models.Response(models.Response.ALL_OK,
                               "Message", models.Response.RIDE_STARTED)
    return resp

def finishRide(trip, passenger):
    """
    Let the system know that a ride succesfully finished, i.e. the Passenger
    has arrived to destination
    """
    try:
        is_already_participating = models.Participation.objects.filter(trip=trip, person=passenger).exists()

        if not is_already_participating:
            resp = models.Response(models.Response.NOT_FOUND,
                    models.Response.MUST_FIRST_REQUEST_RIDE, "boolean", False)
            return resp

    except (KeyError,models.Participation.DoesNotExist):
        resp = models.Response(models.Response.NOT_FOUND,
                               "Message", models.Response.TRIP_NOT_FOUND)
        return resp

    participation = trip.get_participations().only('finished',
                                                   'finished_timestamp',
                                                   'finished_position') \
                  .get(person=passenger)
    participation.finished = True
    participation.finished_timestamp = datetime.datetime.now()
    participation.finished_position_id = passenger.location_id
    participation.save()
    resp = models.Response(models.Response.ALL_OK,
                               "Message", models.Response.RIDE_STARTED)
    return resp
