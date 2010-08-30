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
import location

class Search(models.Model):
    """
    Represents a Trip Search. See `Trip <http://dycapo.org/Protocol#Search>`_ for more info.
    """
    published = models.DateTimeField(auto_now_add=True, blank=False, null=False)
    author = models.ForeignKey('Person', related_name='person', blank=False, null=False)
    origin = models.ForeignKey('Location', related_name='origin', blank=False)
    destination = models.ForeignKey('Location', related_name='destination', blank=False)
    href = models.URLField(verify_exists=False, blank=True, null=False)

    def __repr__(self):
        return str(self.id)

    def __unicode__(self):
        return str(self.id)
    
  
    class Meta:
        app_label = 'server'
