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

from django.conf.urls.defaults import *
from piston.resource import Resource
from rest.handlers import PersonHandler, LocationHandler, LocationPersonHandler, TripHandler, ParticipationHandler, PreferencesHandler

person_handler = Resource(PersonHandler)
location_handler = Resource(LocationHandler)
location_person_handler = Resource(LocationPersonHandler)
trip_handler = Resource(TripHandler)
participation_handler = Resource(ParticipationHandler)
preferences_handler = Resource(PreferencesHandler)

urlpatterns = patterns('',
    url(r'^persons/(?P<username>\w+)/$', person_handler, { 'emitter_format': 'json',}, name='person_handler'),
    url(r'^persons/(?P<username>\w+)/location/$', location_person_handler, { 'emitter_format': 'json',}, name='location_person_handler'),
    url(r'^persons/$', person_handler, name='person_handler'),
    url(r'^preferences/$', preferences_handler, { 'emitter_format': 'json',}, name='preferences_handler'),
    url(r'^preferences/(?P<id>\w+)/$', preferences_handler, { 'emitter_format': 'json',}, name='preferences_handler'),
    url(r'^locations/$', location_handler, { 'emitter_format': 'json',}, name='location_handler'),
    url(r'^locations/(?P<id>\w+)/$', location_handler, { 'emitter_format': 'json',}, name='location_handler'),
    url(r'^trips/(?P<trip_id>\w+)/participations/(?P<username>\w+)/$', participation_handler, { 'emitter_format': 'json',}, name='participation_handler'),
    url(r'^trips/(?P<trip_id>\w+)/participations/$', participation_handler, { 'emitter_format': 'json',}, name='participation_handler'),
    url(r'^trips/(?P<id>\w+)/$', trip_handler, { 'emitter_format': 'json',}, name='trip_handler'),
    url(r'^trips/$', trip_handler, { 'emitter_format': 'json',}, name='trip_handler'),
    
)
