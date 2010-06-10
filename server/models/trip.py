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
This module holds the Trip model
"""

from django.db import models, IntegrityError
import person
import location
import mode as modulemode
import prefs as moduleprefs
import participation as moduleparticipation
import participation

class Trip(models.Model):
    """
    Represents a Trip.
    See `OpenTrip_Core#Entry_Elements <http://opentrip.info/wiki/OpenTrip_Core#Entry_Elements>`_ for more info.
    atom:id, atom:title, atom:link are not present in the models of DyCapo. They should be returned
    in case of an export of a Trip in OpenTrip Feed format.
    TODO: return Prefs and Mode in XML_RPC
    """
    published = models.DateTimeField(auto_now_add=True, blank=False, null=True)
    updated = models.DateTimeField(auto_now=True, blank=False, null=True)
    expires = models.DateTimeField(blank=False, null=True, db_index=True)
    active = models.BooleanField(default=False, db_index=True)
    author = models.ForeignKey('Person', related_name='author', blank=False, null=True)
    locations = models.ManyToManyField(location.Location, blank=False)
    mode = models.ForeignKey(modulemode.Mode, blank=False, null=True)
    prefs = models.ForeignKey(moduleprefs.Prefs, null=True)
    participation = models.ManyToManyField('Person', through='Participation', related_name='participation')

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
        vacancy = self.mode.capacity - participations_for_trip
        if self.mode.vacancy!=vacancy:
            self.mode.vacancy=vacancy
            self.mode.save()

    def has_vacancy(self):
        """
        Returns True if there are emtpy seats available
        """
        self.update_vacancy()
        if self.mode.vacancy > 0:
            return True
        return False


    def save(self, * args, ** kwargs):
        """
        Ensures integrity.
        """
        if not self.expires or not self.mode or not self.prefs or not self.author:
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
            'content': {'mode': self.mode.to_xmlrpc(), 'prefs': self.prefs.to_xmlrpc(), 'locations': locations_dict},
            'author': self.author.to_xmlrpc(),
        }
        return trip_dict

    class Meta:
        app_label = 'server'
