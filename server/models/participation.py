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

    _status = {
        "request" : ("request",1),
        "accept" : ("accept", 2),
        "start" : ("start", 3),
        "finish" : ("finish", 4),
        "cancel": ("cancel", 100),
        "refuse": ("refuse", 200),
    }

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
    locations = models.ManyToManyField(location.Location, related_name="participation_locations")
    href = models.URLField(blank=True, null=False)

    def __unicode__(self):
        return str(self.person) + " -> " + str(self.trip)

    def get_status(self):
        if self.refused:
            return self._status['refuse']
        elif self.requested_deleted:
            return self._status['cancel']
        elif self.finished:
            return self._status['finish']
        elif self.started:
            return self._status['start']
        elif self.accepted:
            return self._status['accept']
        else:
            return self._status['request']

    def get_status_code(self, status_name=None):
        if status_name:
            return self._status[status_name][1]
        else:
            return self.get_status()[1]


    def get_status_name(self, status_code=None):
        if status_code:
            return [k for k, v in self._status.iteritems() if v[1] == status_code][0]
        else:
            return self.get_status()[0]

    class Meta:
        app_label = 'server'
        unique_together = (("person","trip"),)
