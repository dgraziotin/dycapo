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
    allowed_methods = ['GET','POST','PUT']
    model = server.models.Location
    fields = ("town","point","country","region","subregion","days","label","street","postcode","offset","leaves", 
    "recurs","georss_point")
    

    def read(self, request, username):
        user = rest.utils.get_rest_user(request)
        try:
            person = server.models.Person.objects.get(username=username)
        except server.models.Person.DoesNotExist:
            return piston.utils.rc.NOT_FOUND
        result = server.common.getPosition(user,person)
        if result.type=='Location':
            result.value.username = username
        return rest.utils.extract_result_from_response(result)
    
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
        return rest.utils.extract_result_from_response(result)
    
    def update(self, request, username):
        return self.create(request, username)
"""    
    @classmethod
    def resource_uri(*args, **kwargs):
        return ('location_handler', ['username'])
"""