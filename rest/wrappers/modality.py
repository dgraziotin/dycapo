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
Wraps `Modality<http://dycapo.org/Protocol#Modality/>`_ objects in a
RESTful way. 
"""
import piston.handler
import piston.utils
import server.models
import server.utils
import server.common
import rest.utils

class ModalityHandler(piston.handler.BaseHandler):
    allowed_methods = ['GET']
    model = server.models.Modality
    exclude = ('_state','person')
    
    def read(self, request, trip_id=None):
        try:
            if trip_id:
                trip = server.models.Trip.objects.get(id=trip_id, active=True)
                return trip.modality
            else:
                return piston.utils.rc.NOT_FOUND
        except server.models.Trip.DoesNotExist:
            return piston.utils.rc.NOT_FOUND