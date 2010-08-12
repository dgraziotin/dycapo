from piston.handler import BaseHandler
import piston.utils
import server.models
import server.utils
import server.common
import utils
from piston.utils import require_mime

class PersonHandler(BaseHandler):
   allowed_methods = ['GET','POST','PUT']
   model = server.models.Person   
   fields = ('username',)
   
   def read(self, request, username=None):
      return self.get_person(username)
   
   def create(self, request):
      attrs = self.flatten_dict(request.data)
      person = server.models.Person(**attrs)
      result = server.common.register(person)
      return utils.extract_result_from_response(result)
      
   @classmethod
   def get_person(cls, username):
      if not username:
         persons = [{'href' : person.username} for person in server.models.Person.objects.exclude(username='admin').exclude(username='register')]
         dictionary = {}
         dictionary['members'] = persons
         return dictionary
      else:
         return server.models.Person.objects.get(username=username)
"""      
class PersonPositionHandler(BaseHandler):
   allowed_methods = ['GET','POST','PUT']
   model = server.models.Location   
   exclude = ('_state','id')
   
   def read(self, request, username):
      user = server.utils.get_rest_user(request)
      try:
         person = server.models.Person.objects.get(username=username)
      except server.models.Person.DoesNotExist:
         return piston.utils.rc.NOT_FOUND
      result = server.common.getPosition(user,person)
      return utils.extract_result_from_response(result)
   
   #@require_mime('json', 'yaml')
   def create(self, request, *args, **kwargs):
      if not hasattr(request, "data"):
         request.data = request.POST
      attrs = self.flatten_dict(request.data)
      ciao = []
      for k,v in attrs.iteritems():
         #setattr(instance, k, v)  
         ciao.append(v)
      return ciao
"""