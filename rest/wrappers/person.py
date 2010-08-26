from piston.handler import BaseHandler
import piston.utils
import server.models
import server.utils
import server.common
import rest.utils
from piston.utils import require_mime
import django.core.urlresolvers

class PersonHandler(BaseHandler):
    allowed_methods = ['GET','POST','PUT']
    model = server.models.Person
    fields = ('username','gender','email','phone',('location',('town')),'href')

    @classmethod
    def location(self, person):
        return person.location
    
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

    def create(self, request):
        attrs = self.flatten_dict(request.data)
        person = server.models.Person(**attrs)
        result = server.common.register(person)
        if result.type == "Person":
            result.value.href = rest.utils.get_href(request,'person_handler',[result.value.username])
            result.value.save()
        return rest.utils.extract_result_from_response(result)

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

