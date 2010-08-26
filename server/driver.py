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
import rpc4django
import utils

def insertTrip(trip, author, source, destination, modality, preferences):

    vacancy = modality.vacancy
    modality, created = models.Modality.objects.get_or_create(person=author,
                                                 make=modality.make,
                                                 model_name=modality.model_name,
                                                 capacity=modality.capacity,
                                                 kind=modality.kind)
    modality.vacancy = vacancy

    try:
        source.full_clean()
        destination.full_clean()
        modality.full_clean()
        preferences.full_clean()

        source.save()
        destination.save()
        modality.save()
        preferences.save()
    except django.core.exceptions.ValidationError, e:
        resp = models.Response(models.Response.BAD_REQUEST,
                               "Message", e)
        return resp
    except Exception, e:
        resp = models.Response(models.Response.BAD_REQUEST,
                               "Message", e)
        return resp

    trip.author = author
    trip.modality = modality
    trip.preferences = preferences


    try:
        trip.full_clean()
        trip.save()
    except django.core.exceptions.ValidationError, e:
        resp = models.Response(models.Response.BAD_REQUEST,
                               "Message", e)
        return resp
    except Exception, e:
        resp = models.Response(models.Response.BAD_REQUEST,
                               "Message", e)
        return resp

    trip.locations.add(source)
    trip.locations.add(destination)

    participation = models.Participation(person=author, trip=trip,
                                         role='driver')
    participation.save()

    resp = models.Response(models.Response.CREATED,
                           "Trip",
                           trip)

    return resp

def startTrip(trip, driver):

    participation = models.Participation.objects.get(trip=trip.id, role='driver')

    if participation.started:
        resp = models.Response(models.Response.DUPLICATE_ENTRY,
                               "Message", models.Response.TRIP_ALREADY_STARTED)
        return resp

    participation.started = True
    participation.started_timestamp = datetime.datetime.now()
    try:
        participation.started_position_id = driver.position_id
    except models.Location.DoesNotExist:
        participation.started_position = None
    participation.save()
    trip.active = True
    trip.save()

    resp = models.Response(models.Response.ALL_OK,
                           "Message", models.Response.TRIP_STARTED)
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
        resp = models.Response(models.Response.NOT_FOUND,
                               "Message", models.Response.RIDE_REQUESTS_NOT_FOUND)
        return resp
    else:
        participations = [participation.person
                          for participation in participations_for_trip]
        resp = models.Response(models.Response.ALL_OK,
                               "Person[]", participations)
        return resp


def acceptRide(trip, driver, passenger):
    try:
        passenger_participation = models.Participation.objects.get(trip=trip.id,
                                                               person=passenger.id)
    except models.Participation.DoesNotExist:
        resp = models.Response(models.Response.NOT_FOUND,
                               "Message", models.Response.PERSON_NOT_FOUND)
        return resp
    if passenger_participation.requested and not passenger_participation.accepted:
        passenger_participation.accepted = True
        passenger_participation.accepted_timestamp = datetime.datetime.now()
        try:
            passenger_participation.accepted_position_id = passenger.position_id
        except models.Location.DoesNotExist:
            passenger_participation.accepted_position = None

        passenger_participation.save()
        resp = models.Response(models.Response.ALL_OK,
                               "Message", models.Response.RIDE_REQUEST_ACCEPTED)
        return resp

    resp = models.Response(models.Response.DUPLICATE_ENTRY,
                           "Message", models.Response.RIDE_REQUEST_REFUSED)
    return resp


def refuseRide(trip, passenger):
    try:
        passenger_participation = models.Participation.objects.get(trip=trip.id,
                                                               person=passenger.id)
    except models.Participation.DoesNotExist:
        resp = models.Response(models.Response.NOT_FOUND,
                           "Message", models.Response.PERSON_NOT_FOUND)
        return resp


    passenger_participation.refused = True
    passenger_participation.refused_timestamp = datetime.datetime.now()
    try:
        passenger_participation.refused_position_id = passenger.position_id
    except models.Location.DoesNotExist:
        passenger_participation.accepted_position = None

    passenger_participation.save()
    resp = models.Response(models.Response.ALL_OK,
                            "Message", models.Response.RIDE_REQUEST_REFUSED)
    return resp




def finishTrip(trip, driver):
    if driver.is_participating():
        participation = driver.get_active_participation()
        participation.finished = True
        participation.finished_timestamp = utils.now()
        participation.save()
    trip.active = False
    trip.save()

    resp = models.Response(models.Response.DELETED,
                           "Message", models.Response.TRIP_DELETED)
    return resp
