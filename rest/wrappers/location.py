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
Wraps `Location<http://dycapo.org/Protocol#Location/>`_ objects in a
RESTful way. 
"""
import piston.handler
import piston.utils
import server.models
import server.utils
import server.common
import rest.utils

class LocationAnonymousHandler(piston.handler.BaseHandler):
    allowed_methods = ['GET']
    model = server.models.Location
    fields = ("href","id","town","point","country","region","subregion","days","label","street","postcode","offset","leaves", 
    "recurs","georss_point")

    def read(self, request, username=None, id=None):
        if id:
            try:
                location = server.models.Location.objects.get(id=id)
                return location
            except server.models.Location.DoesNotExist:
                return piston.utils.rc.NOT_FOUND
        else:
            return piston.utils.rc.FORBIDDEN
        
class LocationHandler(piston.handler.BaseHandler):
    allowed_methods = ['GET']
    model = server.models.Location
    fields = ("href","id","town","point","country","region","subregion","days","label","street","postcode","offset","leaves", 
    "recurs","georss_point")
    #anonymous = LocationAnonymousHandler

    def read(self, request, username=None, trip_id=None, id=None):
        user = rest.utils.get_rest_user(request)
        try:
            if trip_id:
                if id:
                    trip = server.models.Trip.objects.get(id=trip_id)
                    return trip.locations.filter(id=id).get()
                else:
                    trip = server.models.Trip.objects.get(id=trip_id)
                    return trip.locations.all()
            if username:
                person = server.models.Person.objects.get(username=username)
                result = server.common.getPosition(user,person)
                return rest.utils.extract_result_from_response(result)
            return server.models.Location.objects.all()
        except server.models.Person.DoesNotExist:
            return piston.utils.rc.NOT_FOUND
        except server.models.Location.DoesNotExist:
            return piston.utils.rc.NOT_FOUND
        except server.models.Trip.DoesNotExist:
            return piston.utils.rc.NOT_FOUND
            
class LocationPersonHandler(piston.handler.BaseHandler):
    allowed_methods = ['GET','POST','PUT']
    model = server.models.Location
    fields = ("href","town","point","country","region","subregion","days","label","street","postcode","offset","leaves", 
    "recurs","georss_point")
    
    
    def read(self, request, username=None, id=None):
        user = rest.utils.get_rest_user(request)
        try:
            if id:
                location = server.models.Location.objects.get(id=id)
                return location
            if username:
                person = server.models.Person.objects.get(username=username)
                result = server.common.getPosition(user,person)
                return rest.utils.extract_result_from_response(result)
            return server.models.Location.objects.all()
        except server.models.Person.DoesNotExist:
            return piston.utils.rc.NOT_FOUND
        except server.models.Location.DoesNotExist:
            return piston.utils.rc.NOT_FOUND
       
    
    def create(self, request, username):
        user = rest.utils.get_rest_user(request)
        data = request.data
        location = server.models.Location()
        dict_location = rest.utils.clean_ids(data)
        location = rest.utils.populate_object_from_dictionary(location, dict_location)
        try:
            person = server.models.Person.objects.get(username=username)
        except server.models.Person.DoesNotExist:
            return piston.utils.rc.NOT_FOUND
        result = server.common.setPosition(user, location)
        if result.code != server.models.Response.BAD_REQUEST and \
           result.code != server.models.Response.FORBIDDEN and \
           result.code != server.models.Response.NOT_FOUND:
            result.value.href = rest.utils.get_href(request, "location_person_handler", [user.username])
            result.value.save()
        return rest.utils.extract_result_from_response(result)
    
    def update(self, request, username):
        return self.create(request, username)
    
                       
        
