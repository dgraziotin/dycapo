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
This module holds the Prefs model
"""

from django.db import models
import copy

GENDER_CHOICES = (
    (u'M', u'Male'),
    (u'F', u'Female'),
    (u'B', u'Both'),
)

class Prefs(models.Model):
    """
    Stores the preferences of a Trip set by the Person who creates it.
    See `OpenTrip_Core#Preference_Constructs <http://opentrip.info/wiki/OpenTrip_Core#Preference_Constructs>`_ for more info.
    We kept drive and ride attributes just for compatibility reasons: in OpenTrip Dynamic just a driver should be
    the author of a Trip.
    """
    age = models.CharField(max_length=50, blank=True)
    nonsmoking = models.BooleanField(blank=True)
    gender = models.CharField(max_length=1, choices=GENDER_CHOICES, blank=True)
    drive = models.BooleanField(default=False)
    ride = models.BooleanField(default=False)

    def save(self, * args, ** kwargs):
        """
        Ensures integrity
        """
        try:
            retrieven_prefs = Prefs.objects.get(age=self.age,
                                              nonsmoking=self.nonsmoking,
                                              gender=self.gender,
                                              drive=self.drive,
                                              ride=self.ride
                                              )
        except Prefs.DoesNotExist:
            super(Prefs, self).save(force_insert=True)
            return
        self.id = retrieven_prefs.id
        super(Prefs, self).save(force_update=True)

    def to_xmlrpc(self):
        """
        Prepares the dictionary to be returned when returned as XML-RPC
        """
        prefs_dict = copy.deepcopy(self.__dict__)
        del prefs_dict['id']
        del prefs_dict['_state']
	return prefs_dict

    class Meta:
        app_label = 'server'
