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
This module holds the Mode model
"""

from django.db import models, IntegrityError
import copy

MODE_CHOICES = (
    (u'auto', u'Auto'),
    (u'van', u'Van'),
    (u'bus', u'Bus'),
)

class Mode(models.Model):
    """
    Represents additional information about the mode of transportation being used.
    See `OpenTrip_Core#Mode_Constructs <http://opentrip.info/wiki/OpenTrip_Core#Mode_Constructs>`_ for more info.
    """
    kind = models.CharField(max_length=255, choices=MODE_CHOICES, blank=False)
    capacity = models.PositiveIntegerField(blank=False, null=True, default=0)
    vacancy = models.IntegerField(blank=False, null=True, default=0)
    make = models.CharField(max_length=255, blank=True)
    model = models.CharField(max_length=255, blank=True)
    year = models.PositiveIntegerField(blank=True, null=True, default=0)
    color = models.CharField(max_length=255, blank=True)
    lic = models.CharField(max_length=255, blank=True)
    cost = models.FloatField(blank=True, null=True, default=0.00)
    person = models.ForeignKey('Person', blank=True, null=True)

    def save(self, * args, ** kwargs):
        if not self.kind or not self.capacity or self.vacancy < 0 or not self.make or not self.model:
            raise IntegrityError('Attributes kind, capacity, vacancy, make, model MUST be given.')
        super(Mode, self).save(*args, **kwargs)


    def to_xmlrpc(self):
        """
        Returns a Python dict that contains just the attributes we want to expose
        in out XML-RPC methods
        """
        mode_dict = copy.deepcopy(self.__dict__)
        del mode_dict['id']
        del mode_dict['_state']
        return mode_dict

    class Meta:
        app_label = 'server'
