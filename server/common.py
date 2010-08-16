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
and a passenger have in common """

import models
import utils
import django.contrib.auth.models
import django.core.exceptions
import django.db
import response_codes

def setPosition(current_user, position):
    try:
        position.full_clean()
        position.save()
    except django.core.exceptions.ValidationError, e:
        resp = models.Response(response_codes.BAD_REQUEST,
                               "Message", models.Message(e.message_dict))
        return resp
    except Exception, e:
        resp = models.Response(response_codes.BAD_REQUEST,
                               "Message", models.Message(str(e)))
        return resp

    current_user.position_id = position.id
    current_user.locations.add(position)

    if current_user.is_participating():
        participation = current_user.get_active_participation()
        participation.locations.add(position)

    current_user.save()

    resp = models.Response(response_codes.CREATED,
                           "Message", models.Message(response_codes.POSITION_UPDATED))
    return resp

def getPosition(current_user, person):
    if person.id == current_user.id:
        resp = models.Response(response_codes.ALL_OK,
                               'Location',
                               person.position)
        return resp

    person_participation = person.get_requested_participation()
    current_user_participation = current_user.get_active_participation()

    if not person_participation:
        resp = models.Response(response_codes.NOT_FOUND,
                               'Message', models.Message(response_codes.PERSON_NOT_FOUND))
        return resp

    if person_participation.trip_id != current_user_participation.trip_id:
        resp = models.Response(response_codes.NOT_FOUND,
                               'Message', models.Message(response_codes.PERSON_NOT_FOUND))
        return resp
    else:
        if person_participation.requested_deleted:
            resp = models.Response(response_codes.NOT_FOUND,
                                   'Message', models.Message(response_codes.PERSON_DELETED_REQUESTED_RIDE))
            return resp

    if not person.position:
        resp = models.Response(response_codes.NOT_FOUND,
                               'Message', models.Message(response_codes.LOCATION_NOT_FOUND))
        return resp
    else:
        resp = models.Response(response_codes.ALL_OK,
                               'Location',
                               person.position)
        return resp

def register(person):
    try:
        person.set_password(person.password)
        person.full_clean()
        person.save()
        person.user_permissions.add(
            django.contrib.auth.models.Permission.objects.get(
                codename='can_xmlrpc'))
        resp = models.Response(response_codes.CREATED,
                           'Person',
                           person)
    except django.core.exceptions.ValidationError, e:
        resp = models.Response(response_codes.BAD_REQUEST,'Message',models.Message(e.message_dict))
    except Exception, e:
        resp = models.Response(response_codes.BAD_REQUEST,'Message',models.Message(e.message_dict))
    return resp


def changePassword(person):
    try:
        person.set_password(person.password)
        person.save()
        resp = models.Response(response_codes.ALL_OK,
                           'Message',
                           models.Message(response_codes.PERSON_PASSWORD_CHANGED))
    except (KeyError, models.Person.DoesNotExist):
        resp = models.Response(response_codes.NOT_FOUND,'Message', models.Message(response_codes.PERSON_NOT_FOUND))
    except Exception, e:
        resp = models.Response(response_codes.BAD_REQUEST,
                               'Message',models.Message(str(e)))
    return resp
