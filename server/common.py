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

import models
import utils
import django.contrib.auth.models
import response_codes

def setPosition(position, user):
    try:
        position.save()
    except Exception, e:
        resp = models.Response(response_codes.NEGATIVE, str(e),
                               "boolean", False)
        return resp

    user.position_id = position.id
    user.locations.add(position)

    if user.is_participating():
        participation = user.get_active_participation()
        participation.locations.add(position)

    user.save()

    resp = models.Response(response_codes.POSITIVE,
                           response_codes.POSITION_UPDATED, "boolean", True)
    return resp

def getPosition(person, user):
    if person.id == user.id:
        resp = models.Response(response_codes.POSITIVE,
                               response_codes.POSITION_FOUND, 'Location',
                               person.position.to_xmlrpc())
        return resp

    person_participation = person.get_requested_participation()
    user_participation = user.get_active_participation()

    if not person_participation:
        resp = models.Response(response_codes.NEGATIVE,
                               response_codes.PERSON_NOT_FOUND,
                               'boolean', False)
        return resp

    if person_participation.trip_id != user_participation.trip_id:
        resp = models.Response(response_codes.NEGATIVE,
                               response_codes.PERSON_NOT_FOUND,
                               'boolean', False)
        return resp
    else:
        if person_participation.requested_deleted:
            resp = models.Response(response_codes.NEGATIVE,
                               response_codes.PERSON_DELETED_REQUESTED_RIDE,
                               'boolean', False)
            return resp

    if not person.position:
        resp = models.Response(response_codes.NEGATIVE,
                               response_codes.LOCATION_NOT_FOUND,
                               'boolean', False)
        return resp
    else:
        resp = models.Response(response_codes.POSITIVE,
                               response_codes.POSITION_FOUND, 'Location',
                               person.position.to_xmlrpc())
        return resp

def register(person):
    try:
        person.save()
        person.user_permissions.add(
            django.contrib.auth.models.Permission.objects.get(
                codename='can_xmlrpc'))
        resp = models.Response(response_codes.POSITIVE,
                           response_codes.PERSON_REGISTERED, 'boolean',
                           True)
    except IntegrityError, e:
        resp = models.Response(response_codes.NEGATIVE,
                           str(e), 'boolean',
                           False)
    except Exception, e:
        resp = models.Response(response_codes.NEGATIVE,
                           str(e), 'boolean',
                           False)
    return resp


def changePassword(person):
    try:
        person.set_password(person.password)
        person.save()
        resp = models.Response(response_codes.POSITIVE,
                           response_codes.PERSON_PASSWORD_CHANGED, 'boolean',
                           True)
    except (KeyError, models.Person.DoesNotExist):
        resp = models.Response(response_codes.NEGATIVE,
                               response_codes.PERSON_NOT_FOUND, 'boolean',
                               False)
    except Exception, e:
        resp = models.Response(response_codes.NEGATIVE,
                               str(e), 'boolean',
                               False)
    return resp
