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
This module holds the Preferences model
"""

from django.db import models
import copy

GENDER_CHOICES = (
    (u'M', u'Male'),
    (u'F', u'Female'),
    (u'B', u'Both'),
)

class Preferences(models.Model):
    """
    Stores the preferences of a Trip set by the Person who creates it.
    See  See `Preferences <http://dycapo.org/Protocol#Preferences>`_ for more info.
    We kept drive and ride attributes just for compatibility reasons: in OpenTrip Dynamic just a driver should be
    the author of a Trip.
    """
    age = models.CharField(max_length=50, blank=True)
    nonsmoking = models.BooleanField(blank=True)
    gender = models.CharField(max_length=1, choices=GENDER_CHOICES, blank=True)
    drive = models.BooleanField(default=False)
    ride = models.BooleanField(default=False)
    href = models.URLField(blank=True, null=False)

    def save(self, * args, ** kwargs):
        """
        Ensures integrity
        """
        try:
            retrieven_preferences = Preferences.objects.get(age=self.age,
                                              nonsmoking=self.nonsmoking,
                                              gender=self.gender,
                                              drive=self.drive,
                                              ride=self.ride
                                              )
        except Preferences.DoesNotExist:
            super(Preferences, self).save(force_insert=True)
            return
        self.id = retrieven_preferences.id
        super(Preferences, self).save(force_update=True)

    def to_xmlrpc(self):
        """
        Prepares the dictionary to be returned when returned as XML-RPC
        """
        preferences_dict = copy.deepcopy(self.__dict__)
        del preferences_dict['id']
        del preferences_dict['_state']
        return preferences_dict

    class Meta:
        app_label = 'server'
