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
This module holds the Trip model
"""

from django.db import models, IntegrityError
import person
import location
import modality as modulemodality
import preferences as modulepreferences
import participation as moduleparticipation
import participation

class Trip(models.Model):
    """
    Represents a Trip.
    See `OpenTrip_Core#Entry_Elements <http://opentrip.info/wiki/OpenTrip_Core#Entry_Elements>`_ for more info.
    atom:id, atom:title, atom:link are not present in the models of DyCapo. They should be returned
    in case of an export of a Trip in OpenTrip Feed format.
    """
    cannot_update = [
        'published',
        'updated',
        'expires',
        'locations',
        'modality',
        'participation',
    ]
    published = models.DateTimeField(auto_now_add=True, blank=False, null=False)
    updated = models.DateTimeField(auto_now=True, blank=False, null=False)
    expires = models.DateTimeField(blank=False, null=True, db_index=True)
    active = models.BooleanField(default=False, db_index=True)
    author = models.ForeignKey('Person', related_name='author', blank=False, null=False)
    locations = models.ManyToManyField(location.Location, blank=False)
    modality = models.ForeignKey(modulemodality.Modality, blank=False, null=False)
    preferences = models.ForeignKey(modulepreferences.Preferences, null=False)
    participation = models.ManyToManyField('Person', through='Participation', related_name='participation')
    href = models.URLField(blank=True, null=False)

    def __repr__(self):
        return str(self.id)

    def __unicode__(self):
        return str(self.id)

    def get_destination(self):
        """
        Returns the location representing the destination of the Trip
        """
        destination = self.locations.filter(point='dest').only("id","georss_point")[0]
        return destination

    def update_vacancy(self):
        """
        Checks how many seats are still available in car and updates the attribute consistently
        """
        participations_for_trip = self.get_participations().exclude(role='driver').filter(started=True).filter(finished=False).count()
        vacancy = self.modality.capacity - participations_for_trip
        if self.modality.vacancy!=vacancy:
            self.modality.vacancy=vacancy
            self.modality.save()

    def has_vacancy(self):
        """
        Returns True if there are emtpy seats available
        """
        self.update_vacancy()
        if self.modality.vacancy > 0:
            return True
        return False


    def save(self, * args, ** kwargs):
        """
        Ensures integrity.
        """
        if not self.expires or not self.modality or not self.preferences or not self.author:
            raise IntegrityError('Trip objects MUST have expires and content attributes.')
        super(Trip, self).save(*args, ** kwargs) # Call the "real" save() method.

    def get_participations(self):
        """
        Returns all the Participations of the Trip
        """
        participations = moduleparticipation.Participation.objects.filter(trip=self.id)
        return participations


    def to_xmlrpc(self):
        """
        Returns a Python dict that contains just the attributes we want to expose
        in out XML-RPC methods
        """
        locations = self.locations.all()
        locations_dict = []
        for location in locations:
            locations_dict.append(location.to_xmlrpc())
        trip_dict = {
            'id': self.id,
            'published': self.published,
            'updated': self.updated,
            'expires': self.expires,
            'modality': self.modality.to_xmlrpc(),
            'preferences': self.preferences.to_xmlrpc(),
            'locations': locations_dict,
            'author': self.author.to_xmlrpc(),
        }
        return trip_dict

    class Meta:
        app_label = 'server'
