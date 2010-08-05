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
This module holds the Participation model
"""

from django.db import models
import person as moduleperson
import trip as moduletrip
import location

ROLE_CHOICES = (
    (u'rider', u'Rider'),
    (u'driver', u'Driver'),
)


class Participation(models.Model):
    """
    Describes the participation of a Person in a Trip.
    This is an OpenTrip extension and should be considered as a proposal for OpenTrip Dynamic.
    It is currently used internally in Dycapo
    """
    person = models.ForeignKey('Person', related_name="participant")
    trip = models.ForeignKey(moduletrip.Trip, related_name="trip")
    role = models.CharField(max_length=6, choices=ROLE_CHOICES, blank=False)
    requested = models.BooleanField(blank=False, default=False)
    requested_timestamp = models.DateTimeField(auto_now_add=False, blank=False, null=True)
    requested_position = models.ForeignKey(location.Location, related_name="requested_position", blank=True, null=True)
    requested_deleted = models.BooleanField(blank=False, default=False)
    requested_deleted_timestamp = models.DateTimeField(auto_now_add=False, blank=False, null=True)
    requested_deleted_position = models.ForeignKey(location.Location, related_name="requested_deleted_position", blank=True, null=True)
    accepted = models.BooleanField(blank=False, default=False)
    accepted_timestamp = models.DateTimeField(auto_now_add=False, blank=False, null=True)
    accepted_position = models.ForeignKey(location.Location, related_name="accepted_position", blank=True, null=True)
    refused = models.BooleanField(blank=False, default=False)
    refused_timestamp = models.DateTimeField(auto_now_add=False, blank=False, null=True)
    refused_position = models.ForeignKey(location.Location, related_name="refused_position", blank=True, null=True)
    started = models.BooleanField(blank=False, default=False)
    started_timestamp = models.DateTimeField(auto_now_add=False, blank=False, null=True)
    started_position = models.ForeignKey(location.Location, related_name="started_position", blank=True, null=True)
    finished = models.BooleanField(blank=False, default=False)
    finished_timestamp = models.DateTimeField(auto_now_add=False, blank=False, null=True)
    finished_position = models.ForeignKey(location.Location, related_name="finished_position", blank=True, null=True)
    locations = models.ManyToManyField(location.Location, related_name="participaion_locations")


    def __unicode__(self):
        return str(self.person) + " -> " + str(self.trip)

    class Meta:
        app_label = 'server'
