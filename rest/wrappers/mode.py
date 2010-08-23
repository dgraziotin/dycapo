from piston.handler import BaseHandler
import piston.utils
import server.models
import server.utils
import server.common
import rest.utils
from piston.utils import require_mime
import django.core.urlresolvers

class ModeHandler(BaseHandler):
    allowed_methods = ['GET','POST','PUT']
    model = server.models.Mode
    #fields = ('make')

    """
    @classmethod
    def resource_uri(*args, **kwargs):
        return ('person_handler', ['username',])
    """
