from piston.handler import BaseHandler
import piston.utils
import server.models
import server.utils
import server.common
import rest.utils
from piston.utils import require_mime
import django.core.urlresolvers
import re
    
class LocationHandler(BaseHandler):
    allowed_methods = ['GET']
    model = server.models.Location
    fields = ("href","id","town","point","country","region","subregion","days","label","street","postcode","offset","leaves", 
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
            
class LocationPersonHandler(BaseHandler):
    allowed_methods = ['GET','POST','PUT']
    model = server.models.Location
    fields = ("href","id","town","point","country","region","subregion","days","label","street","postcode","offset","leaves", 
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
        if result.type == "Location":
            result.value.href = rest.utils.get_href(request, "location_person_handler", [user.username])
            result.value.save()
        return rest.utils.extract_result_from_response(result)
    
    def update(self, request, username):
        return self.create(request, username)
    
                       
        
