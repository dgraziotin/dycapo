from piston.handler import BaseHandler
import server.models

class PersonHandler(BaseHandler):
   allowed_methods = ('GET','POST')
   model = server.models.Person   

   def read(self, request):
      inst = server.models.Person.objects.all()
      return inst