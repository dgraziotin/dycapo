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
Wraps `Preferences<http://dycapo.org/Protocol#Preferences/>`_ objects in a
RESTful way. 
"""
import piston.handler
import piston.utils
import server.models
import server.utils
import server.common
import rest.utils

class PreferencesHandler(piston.handler.BaseHandler):
    allowed_methods = ['GET']
    model = server.models.Preferences
    fields = ("nonsmoking",
        "gender",
        "ride",
        "drive",
        "id",
        "age","href")
    
    def read(self, request, id=None):
        try:
            if id:
                preferences = server.models.Preferences.objects.get(id=id)
                return preferences
            else:
                return server.models.Preferences.objects.all()
        except server.models.Preferences.DoesNotExist:
            return piston.utils.rc.NOT_FOUND