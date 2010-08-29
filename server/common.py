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

""" This module holds all the methods that a driver
and a passenger have in common """

import models
import utils
import django.contrib.auth.models
import django.core.exceptions
import django.db

def setPosition(current_user, position):
    """
    Verifies the validity of the Location object then links it to
    the given Person, as current Person position and/or Participation
    location
    """
    try:
        position.full_clean()
        position.save()
    except django.core.exceptions.ValidationError, e:
        resp = models.Response(models.Response.BAD_REQUEST,
                               "Message", e)
        return resp
    except Exception, e:
        resp = models.Response(models.Response.BAD_REQUEST,
                               "Message", e)
        return resp

    current_user.location_id = position.id
    current_user.locations.add(position)

    if current_user.is_participating():
        participation = current_user.get_active_participation()
        participation.locations.add(position)

    current_user.save()

    resp = models.Response(models.Response.CREATED,
                           "Message", models.Response.POSITION_UPDATED)
    return resp

def getPosition(current_user, person):
    """
    Verifies the permissions of both users given, then eventually returns
    the location of the Person
    """
    if person.id == current_user.id:
        resp = models.Response(models.Response.ALL_OK,
                               'Location',
                               person.location)
        return resp

    person_participation = person.get_requested_participation()
    current_user_participation = current_user.get_active_participation()

    if not person_participation:
        resp = models.Response(models.Response.NOT_FOUND,
                               'Message', models.Response.PERSON_NOT_FOUND)
        return resp

    if person_participation.trip_id != current_user_participation.trip_id:
        resp = models.Response(models.Response.NOT_FOUND,
                               'Message', models.Response.PERSON_NOT_FOUND)
        return resp
    else:
        if person_participation.requested_deleted:
            resp = models.Response(models.Response.NOT_FOUND,
                                   'Message', models.Response.PERSON_DELETED_REQUESTED_RIDE)
            return resp

    if not person.location:
        resp = models.Response(models.Response.NOT_FOUND,
                               'Message', models.Response.LOCATION_NOT_FOUND)
        return resp
    else:
        resp = models.Response(models.Response.ALL_OK,
                               'Location',
                               person.location)
        return resp

def register(person):
    """
    Registers a Person to the system.
    """
    try:
        person.set_password(person.password)
        person.full_clean()
        person.save()
        person.user_permissions.add(
            django.contrib.auth.models.Permission.objects.get(
                codename='can_xmlrpc'))
        resp = models.Response(models.Response.CREATED,
                           'Person',
                           person)
    except django.core.exceptions.ValidationError, e:
        resp = models.Response(models.Response.BAD_REQUEST,'Message',e)
    except Exception, e:
        resp = models.Response(models.Response.BAD_REQUEST,'Message',e)

    return resp

def updatePerson(current_user, person):
    """
    Updates current_user Person with the attributes of person Person.
    """
    try:
        if hasattr(person,'password'):
            if not person.check_password(person.password):
                person.set_password(person.password)

        current_user = utils.synchronize_objects(current_user, person)
        current_user.save()
        resp = models.Response(models.Response.ALL_OK,'Person',current_user)
    except Exception, e:
        resp = models.Response(models.Response.BAD_REQUEST,'Message',e)
    return resp

def changePassword(person):
    """
    Changes the password of the user, supplied in person.password
    """
    try:
        person.set_password(person.password)
        person.save()
        resp = models.Response(models.Response.ALL_OK,
                           'Message',
                           models.Response.PERSON_PASSWORD_CHANGED)
    except (KeyError, models.Person.DoesNotExist):
        resp = models.Response(models.Response.NOT_FOUND,'Message',models.Response.PERSON_NOT_FOUND)
    except Exception, e:
        resp = models.Response(models.Response.BAD_REQUEST,
                               'Message',e)
    return resp
