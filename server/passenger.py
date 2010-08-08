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
import matching
import models
import response_codes
import rpc4django
import utils
import django.db


def searchRide(source, destination, passenger):
        
    passenger_active_participation = passenger.get_active_participation()
    if passenger_active_participation:
        resp = models.Response(response_codes.FORBIDDEN,
                               response_codes.RIDE_IN_COURSE,
                               "Trip", passenger_active_participation.trip)
        return resp

    if passenger.position.georss_point != source.georss_point:
        passenger.position = source
        passenger.position.save()
    
    trips = matching.search_ride(destination,passenger)

    if not trips:
        return models.Response(response_codes.NOT_FOUND,
                               response_codes.RIDES_NOT_FOUND,
                               "boolean", False)

    return models.Response(response_codes.ALL_OK,
                           response_codes.RIDES_FOUND,
                           "Trip", [trip for trip in trips])

def requestRide(trip, passenger):
    passenger_active_participation = passenger.get_active_participation()
    
    if passenger_active_participation:
        resp = models.Response(response_codes.FORBIDDEN,
                               response_codes.RIDE_IN_COURSE,
                               "Trip", passenger_active_participation.trip)
        return resp

    participation = models.Participation(trip_id = trip.id,
                                         person_id = passenger.id,
                                         role = 'rider',
                                         requested = True,
                                         requested_timestamp = 
                                         datetime.datetime.now())

    if passenger.position:
        participation.requested_position_id = passenger.position_id
    try:
        participation.save()
        resp = models.Response(response_codes.CREATED,
                               response_codes.RIDE_REQUESTED,
                               "boolean", True)
    except django.db.IntegrityError, e:
        resp = models.Response(response_codes.BAD_REQUEST,
                               str(e),
                               "boolean", False)
    return resp

def statusRide(trip, passenger):
    passenger_active_participation = passenger.get_active_participation()
    if passenger_active_participation:
        resp = models.Response(response_codes.FORBIDDEN,
                               response_codes.RIDE_IN_COURSE,
                               "Trip", passenger_active_participation.trip)
        return resp
    

    try:
        passenger_participation = models.Participation.objects.get(trip=trip.id,
                                                               person=passenger.id)
    except models.Participation.DoesNotExist:
        resp = models.Response(response_codes.NOT_FOUND,
                               response_codes.PERSON_NOT_FOUND,
                               "boolean", False)
    if passenger_participation.accepted:
        
        resp = models.Response(response_codes.ALL_OK,
                               response_codes.RIDE_REQUEST_ACCEPTED,
                               "Person", trip.author.to_xmlrpc(position=True))
    else:
        resp = models.Response(response_codes.NOT_FOUND,
                               response_codes.RIDE_REQUEST_NOT_YET_ACCEPTED,
                               "boolean", False)
    return resp


def cancelRide(trip, passenger):
    try:
        passenger_participation = models.Participation.objects.get(trip=trip.id,
                                                               person=passenger.id)
    except models.Participation.DoesNotExist:
        resp = models.Response(response_codes.NOT_FOUND,
                    response_codes.MUST_FIRST_REQUEST_RIDE, "boolean", False)
        return resp

    passenger_participation.requested_deleted = True
    passenger_participation.requested_deleted_timestamp = datetime.datetime.now()

    if passenger.position:
        passenger_participation.requested_deleted_position_id = passenger.position_id
    try:
        passenger_participation.save()
        resp = models.Response(response_codes.DELETED,
                               response_codes.PERSON_DELETED_REQUESTED_RIDE,
                               "boolean", True)
    except django.db.IntegrityError, e:
        resp = models.Response(response_codes.BAD_REQUEST,
                               str(e),
                               "boolean", False)
    return resp

def startRide(trip, passenger):
    try:
        is_already_participating = models.Participation.objects.filter(trip=trip, person=passenger).exists()

        if not is_already_participating:
            resp = models.Response(response_codes.NOT_FOUND,
                    response_codes.MUST_FIRST_REQUEST_RIDE, "boolean", False)
            return resp
    except (KeyError,models.Participation.DoesNotExist):
        resp = models.Response(response_codes.NOT_FOUND,
                               response_codes.TRIP_NOT_FOUND,
                               "boolean", False)
        return resp

    try:
        participation = trip.get_participations().only('started',
                                                       'started_timestamp',
                                                       'started_position') \
                      .get(person=passenger)
        participation.started = True
        participation.started_timestamp = datetime.datetime.now()
        participation.started_position_id = passenger.position_id
        participation.save()
    except Exception, e:
        resp = models.Response(response_codes.BAD_REQUEST,
                               response_codes.TRIP_NOT_FOUND,
                               "boolean", False)
        return resp
    resp = models.Response(response_codes.ALL_OK,
                               response_codes.RIDE_STARTED,
                               "boolean", True)
    return resp

def finishRide(trip, passenger):
    try:
        is_already_participating = models.Participation.objects.filter(trip=trip, person=passenger).exists()

        if not is_already_participating:
            resp = models.Response(response_codes.NOT_FOUND,
                    response_codes.MUST_FIRST_REQUEST_RIDE, "boolean", False)
            return resp

    except (KeyError,models.Participation.DoesNotExist):
        resp = models.Response(response_codes.NOT_FOUND,
                               response_codes.TRIP_NOT_FOUND,
                               "boolean", False)
        return resp

    participation = trip.get_participations().only('finished',
                                                   'finished_timestamp',
                                                   'finished_position') \
                  .get(person=passenger)
    participation.finished = True
    participation.finished_timestamp = datetime.datetime.now()
    participation.finished_position_id = passenger.position_id
    participation.save()
    resp = models.Response(response_codes.ALL_OK,
                               response_codes.RIDE_STARTED,
                               "boolean", True)
    return resp
