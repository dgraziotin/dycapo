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
Wraps `Participation<http://dycapo.org/Protocol#Participation/>`_ objects in a
RESTful way. 
"""
from piston.handler import BaseHandler
import piston.utils
import server.models
import server.utils
import server.common
import rest.utils
from piston.utils import require_mime
import django.core.urlresolvers
import re

class ParticipationHandler(BaseHandler):
    allowed_methods = ['GET','POST','PUT','DELETE']
    model = server.models.Participation
    fields = ('href','person','status')

    def read(self, request, trip_id=None, username=None):
        if username:
            try:
                trip = server.models.Trip.objects.get(id=trip_id, active=True)
                participation = trip.get_participations().filter(person__username=username)[0]
                participation.status = participation.get_status_name()
                return participation
            except server.models.Trip.DoesNotExist:
                return piston.utils.rc.NOT_FOUND
            except IndexError:
                return piston.utils.rc.NOT_FOUND
        try:
            trip = server.models.Trip.objects.get(id=trip_id, active=True)
            participations = trip.get_participations()
            for participation in participations:
                participation.status = participation.get_status_name()
            return participations
        except server.models.Trip.DoesNotExist:
            return piston.utils.rc.NOT_FOUND

    def create(self, request, trip_id):
        data = request.data
        current_user = rest.utils.get_rest_user(request)
        try:
            trip = server.models.Trip.objects.get(id=trip_id)
            status = data['status']
            if status == server.models.Participation._status['request'][0]:
                result = server.passenger.requestRide(trip, current_user)
            else:
                result = server.models.Response(
                        server.models.Response.BAD_REQUEST,
                        'Message',
                         {'status': [u'This field is required and its value must be request.']})
            if hasattr(result.value,'person'):
                result.value.href = rest.utils.get_href(request, 'participation_handler', [result.value.person.username])
                result.value.save()
            return rest.utils.extract_result_from_response(result)

        except server.models.Trip.DoesNotExist:
            return piston.utils.rc.NOT_FOUND
        except KeyError, e:
            result = server.models.Response(
                    server.models.Response.BAD_REQUEST,
                    'Message',
                     e)

            return rest.utils.extract_result_from_response(result)


    def update(self, request, trip_id=None, username=None):
        data = request.data
        current_user = rest.utils.get_rest_user(request)
        try:
            trip = server.models.Trip.objects.get(id=trip_id)
            status = data['status']
            person_participation = trip.get_participations().filter(person__username=username).get()
            person = person_participation.person

            if current_user != person and current_user != trip.author:
            # only the author of the trip or the owner of the
            # participation can manipulate here
                return piston.utils.rc.FORBIDDEN

            status_code = person_participation.get_status_code(status)

            if status_code <= person_participation.get_status_code():
                result = server.models.Response(
                        server.models.Response.FORBIDDEN,
                        'Message',
                         'Can not fall back to "' +str(status)+ '" status at this point')
                return rest.utils.extract_result_from_response(result)

            status_set = server.models.Participation._status

            if status == status_set['accept'][0]:
                if not current_user == trip.author:
                    # this is a status that can be set just by the driver
                    return piston.utils.rc.FORBIDDEN
                result = server.driver.acceptRide(trip, current_user, person_participation.person)
            elif status == status_set['start'][0]:
                result = server.passenger.startRide(trip, person_participation.person)
            elif status == status_set['finish'][0]:
                result = server.passenger.finishRide(trip, person_participation.person)
            else:
                result = server.models.Response(
                        server.models.Response.FORBIDDEN,
                        'Message',
                         'Can not fall back to ' +status+ 'status at this point')
            return rest.utils.extract_result_from_response(result)


        except server.models.Trip.DoesNotExist, server.models.Participation.DoesNotExist:
            return piston.utils.rc.NOT_FOUND
        except KeyError, e:
            result = server.models.Response(
                    server.models.Response.BAD_REQUEST,
                    'Message',
                     e)

            return rest.utils.extract_result_from_response(result)

    def delete(self, request, trip_id=None, username=None):
        data = request.data
        current_user = rest.utils.get_rest_user(request)
        try:
            trip = server.models.Trip.objects.get(id=trip_id)
            status = data['status']
            person_participation = trip.get_participations().filter(person__username=username).get()
            person = person_participation.person

            if current_user != person and current_user != trip.author:
            # only the author of the trip or the owner of the
            # participation can manipulate here
                return piston.utils.rc.FORBIDDEN

            if current_user == person:
                return server.passenger.cancelRide(trip, current_user)
            elif current_user == trip.author:
                return server.driver.refuseRide(trip, person)
            else:
                return piston.utils.rc.FORBIDDEN


        except server.models.Trip.DoesNotExist, server.models.Participation.DoesNotExist:
            return piston.utils.rc.NOT_FOUND
        except KeyError, e:
            result = server.models.Response(
                    server.models.Response.BAD_REQUEST,
                    'Message',
                     e)

            return rest.utils.extract_result_from_response(result)