from piston.handler import BaseHandler
import piston.utils
import server.models
import server.utils
import server.common
import rest.utils
from piston.utils import require_mime
import django.core.urlresolvers

class ModalityHandler(BaseHandler):
    allowed_methods = ['GET']
    model = server.models.Modality
    exclude = ('_state','person')
    
    def read(self, request, id=None):
        user = rest.utils.get_rest_user(request)
        try:
            if id:
                modality = server.models.Modality.objects.get(id=id)
                return modality
            else:
                return server.models.Modality.objects.all()
        except server.models.Modality.DoesNotExist:
            return piston.utils.rc.NOT_FOUND