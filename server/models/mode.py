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
