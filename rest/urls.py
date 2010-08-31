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
from rest.handlers import PersonHandler, LocationHandler, LocationPersonHandler 
from rest.handlers import TripHandler, ParticipationHandler, PreferencesHandler
from rest.handlers import ModalityHandler, ApiHandler, SearchHandler

from authentication import HttpBasicAuthentication

auth = HttpBasicAuthentication()
ad = { 'authentication': auth }

person_handler = Resource(handler=PersonHandler,**ad)
location_handler = Resource(handler=LocationHandler,**ad)
location_person_handler = Resource(handler=LocationPersonHandler,**ad)
trip_handler = Resource(handler=TripHandler,**ad)
participation_handler = Resource(handler=ParticipationHandler,**ad)
preferences_handler = Resource(handler=PreferencesHandler,**ad)
modality_handler = Resource(handler=ModalityHandler,**ad)
api_handler = Resource(handler=ApiHandler)
search_handler = Resource(handler=SearchHandler, **ad)

urlpatterns = patterns('',
    url(r'^persons/(?P<username>\w+)/$', person_handler, { 'emitter_format': 'json',}, name='person_handler'),
    url(r'^persons/(?P<username>\w+)/location/$', location_person_handler, { 'emitter_format': 'json',}, name='location_person_handler'),
    url(r'^searches/$', search_handler, name='search_handler'),
    url(r'^searches/(?P<id>\w+)/$', search_handler, name='search_handler'),
    url(r'^persons/$', person_handler, name='person_handler'),
    url(r'^trips/$', trip_handler, { 'emitter_format': 'json',}, name='trip_handler'),
    url(r'^trips/(?P<id>\w+)/$', trip_handler, { 'emitter_format': 'json',}, name='trip_handler'),
    url(r'^trips/(?P<trip_id>\w+)/modality/$', modality_handler, { 'emitter_format': 'json',}, name='modality_handler'),
    url(r'^trips/(?P<trip_id>\w+)/preferences/$', preferences_handler, { 'emitter_format': 'json',}, name='preferences_handler'),
    url(r'^trips/(?P<trip_id>\w+)/participations/(?P<username>\w+)/$', participation_handler, { 'emitter_format': 'json',}, name='participation_handler'),
    url(r'^trips/(?P<trip_id>\w+)/participations/$', participation_handler, { 'emitter_format': 'json',}, name='participation_handler'),
    url(r'^trips/(?P<trip_id>\w+)/locations/$', location_handler, { 'emitter_format': 'json',}, name='location_handler'),
    url(r'^trips/(?P<trip_id>\w+)/locations/(?P<id>\w+)/$', location_handler, { 'emitter_format': 'json',}, name='location_handler'),
    url(r'^$', api_handler, { 'emitter_format': 'json',}, name='api_handler'),
    
)
