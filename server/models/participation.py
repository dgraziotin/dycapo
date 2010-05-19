"""
This file is part of Dycapo.
    Copyright (C) 2009, 2010 FBK Foundation, (http://www.fbk.eu)
    Authors: SoNet Group (see AUTHORS)
    Dycapo is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Dycapo is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with Dycapo.  If not, see <http://www.gnu.org/licenses/>.

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
    accepted = models.BooleanField(blank=False, default=False)
    accepted_timestamp = models.DateTimeField(auto_now_add=False, blank=False, null=True)
    accepted_position = models.ForeignKey(location.Location, related_name="accepted_position", blank=True, null=True)
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
