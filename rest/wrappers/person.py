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
Wraps `Person<http://dycapo.org/Protocol#Person/>`_ objects in a
RESTful way. 
"""
from piston.handler import BaseHandler, AnonymousBaseHandler
import piston.utils
import server.models
import server.utils
import server.common
import rest.utils
from piston.utils import require_mime
import django.core.urlresolvers


class AnonymousPersonHandler(AnonymousBaseHandler):
    allowed_methods = ['GET','POST']
    model = server.models.Person
    fields = ('username','href')
    
    def read(self, request, username=None):
        if username:
            return piston.utils.rc.FORBIDDEN
        try:
            person = server.models.Person.objects.all().exclude(username='admin').exclude(username='register')
            return person
        except server.models.Person.DoesNotExist:
            return piston.utils.rc.NOT_FOUND
    
    def create(self, request):
        attrs = self.flatten_dict(request.data)
        person = server.models.Person(**attrs)
        result = server.common.register(person)
        if result.type == "Person":
            result.value.href = rest.utils.get_href(request,'person_handler',[result.value.username])
            result.value.save()
            return result.value
        return rest.utils.extract_result_from_response(result)

   
class PersonHandler(BaseHandler):
    allowed_methods = ['GET','PUT']
    model = server.models.Person
    fields = ('username','gender','email','phone',('location', ('fake','href')),'href')
    anonymous = AnonymousPersonHandler
    
    
    def read(self, request, username=None):
        current_user = rest.utils.get_rest_user(request)
        if not username:
            persons = server.models.Person.objects.exclude(username='admin').exclude(username='register')
            return persons
        else:
            try:
                person = server.models.Person.objects.get(username=username)
                return person
            except server.models.Person.DoesNotExist:
                return piston.utils.rc.NOT_FOUND

    def update(self, request, username=None):
        if not username:
            return piston.utils.rc.NOT_FOUND
        attrs = self.flatten_dict(request.data)
        current_user = rest.utils.get_rest_user(request)
        try:
            person = server.models.Person(**attrs)
            if person.username != current_user.username:
                return piston.utils.rc.FORBIDDEN
        except Exception, e:
            rc = piston.utils.rc.BAD_REQUEST
            rc.write(str(e))
            return rc
        result = server.common.updatePerson(current_user, person)
        return rest.utils.extract_result_from_response(result)
