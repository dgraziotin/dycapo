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
RESTifies all stored objects, in case they are not
"""
import server.models
from django.core.management.base import BaseCommand
from django.core.urlresolvers import reverse
import settings

class Command(BaseCommand):
    args = ''
    help = 'Tries to fill in href attributes of each object in python'

    def get_href(self, handler, args):
        return settings.DYCAPO_URL + reverse(handler,args=args)

    def restify_locations(self):
        locations = server.models.Location.objects.filter(href='')
        for location in locations:
            if location.point == 'posi':
                try:
                    person = server.models.Person.objects.get(location=location)
                    location.href = self.get_href("location_person_handler", [person.username])
                    location.save()
                except server.models.Person.DoesNotExist:
                    pass
                except Exception, e:
                    print e
            else:
                try:
                    trip = server.models.Trip.objects.get(locations__id__exact=location.id)
                    location.href = self.get_href("location_handler", [trip.id,location.id])
                    location.save()
                except server.models.Person.DoesNotExist:
                    pass
                except Exception, e:
                    print e
    
                    
    def restify_persons(self):
        persons = server.models.Person.objects.filter(href='')
        for person in persons:
            try:
                person.href = self.get_href("person_handler", [person.username])
                person.save()
            except Exception, e:
                print e

    def restify_modalities(self):
        modalities = server.models.Modality.objects.filter(href='')
        for modality in modalities:
            try:
                modality.href = self.get_href("modality_handler", [trip])
                modality.save()
            except Exception, e:
                print e
                
    def restify_preferences(self):
        preferences = server.models.Preferences.objects.filter(href='')
        for preference in preferences:
            try:
                preference.href = self.get_href("preferences_handler", [preference.id])
                preference.save()
            except Exception, e:
                print e
                
    def restify_trips(self):
        trips = server.models.Trip.objects.filter(href='')
        for trip in trips:
            try:
                trip.href = self.get_href("trip_handler", [trip.id])
                trip.save()
            except Exception, e:
                print e
                
    def restify_participations(self):
        participations = server.models.Participation.objects.filter(href='')
        for participation in participations:
            try:
                participation.href = self.get_href("participation_handler", [participation.trip.id,participation.person.username])
                participation.save()
            except Exception, e:
                print e
            
    
    def handle(self, *args, **options):
        self.restify_locations()
        self.restify_persons()
        self.restify_modalities()
        self.restify_preferences()
        self.restify_trips()
        self.restify_participations()