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
    fields = ('username','gender','email','phone','resource_location_uri',)

    def read(self, request, username=None):
        if not username:
            persons = server.models.Person.objects.exclude(username='admin').exclude(username='register')
            return persons
        else:
            try:
                person = server.models.Person.objects.get(username=username)
                person.resource_location_uri = django.core.urlresolvers.reverse('location_handler',args=[person.username])
                return person
            except server.models.Person.DoesNotExist:
                return piston.utils.rc.NOT_FOUND

    def create(self, request):
        attrs = self.flatten_dict(request.data)
        person = server.models.Person(**attrs)
        result = server.common.register(person)
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
    
    @classmethod
    def resource_uri(*args, **kwargs):
        return ('person_handler', ['username',])
