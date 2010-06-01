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
This module holds the Person model
"""

import django.contrib.auth.models as authmodels
import django.db.models as models
import location
import participation

GENDER_CHOICES = (
    (u'M', u'Male'),
    (u'F', u'Female'),
)

class Person(authmodels.User):
    """
    Represents a Person as described on `OpenTrip_Core Person_Constructs <http://opentrip.info/wiki/OpenTrip_Core#Person_Constructs>`_.
    It's a subclass of django.contrib.auth.models.User. I use the technique described on
    `this blog <http://steps.ucdavis.edu/People/jbremson/extending-the-user-model-in-django>`_  to get Person objects
    instead of User objects when requesting a user.
    """
    # first_name from Django
    # last_name from Django
    # email from Django
    # last_login from Django
    # date_joined from Django
    # username from Django
    # password from Django
    uri = models.CharField(max_length=200, blank=True)
    phone = models.CharField(max_length=200, null=True, unique=True)
    position = models.ForeignKey(location.Location, blank=True, null=True)
    age = models.PositiveIntegerField(null=True, default=0)
    gender = models.CharField(max_length=1, choices=GENDER_CHOICES, blank=False, null=True)
    smoker = models.BooleanField(default=False)
    blind = models.BooleanField(default=False)
    deaf = models.BooleanField(default=False)
    dog = models.BooleanField(default=False)
    locations = models.ManyToManyField(location.Location, related_name="person_locations", blank=True, null=True) # MUST

    def get_recent_locations(self, max_results=10):
        """
        Returns the last n locations of a Person. If the person is participating
        in a Trip as a Driver, it directly returns the last n locations stored
        in the Participation, for having better results in research algorithms
        """
        if self.get_active_participation() and self.get_active_participation().role == 'driver':
            participation = self.get_active_participation()
            recent_locations = list(participation.locations.filter().only("id","georss_point").order_by('-id')[:max_results])
        else:
            recent_locations = list(self.locations.filter().only("id","georss_point").order_by('-id')[:max_results])
        recent_locations.reverse()
        return recent_locations

    def is_participating(self):
        """
        Returns true if the Person is actively participating in a Trip
        """
        is_participating = participation.Participation.objects.filter(started=True, finished=False, person=self, trip__active=True).exists()
        return is_participating

    def get_active_participation(self):
        """
        Returns the currently Participation of the Person in a Trip.
        """
        participations = participation.Participation.objects.filter(started=True, finished=False, person=self, trip__active=True, requested_deleted=False)
        if not participations: return None
        # TODO: we should purge here in case of multiple Participations returned
        if len(participations) > 1: return None
        return participations[0]

    def get_participating_trip(self):
        """
        Returns the Trip in which the Person is Participating
        """
        participations = participation.Participation.objects.filter(started=True, finished=False, person=self, trip__active=True)
        if not participations: return None
        # TODO: we should purge here in case of multiple Participations returned
        if len(participations) > 1: return None
        return participations[0].trip

    # Use UserManager to get the create_user method, etc.
    objects = authmodels.UserManager()

    def __unicode__(self):
        return self.username

    def to_xmlrpc(self):
        """
        Returns a Python dict that contains just the attributes we want to expose
        in out XML-RPC methods
        """
        person_dict = {
            'username': self.username
        }
        return person_dict

    class Meta:
        app_label = 'server'
        permissions = (
               ("can_xmlrpc", "Can perform XML-RPC to Dycapo"),
               ("can_register", "Can register to the System using XML-RPC"),
               )
