from piston.handler import BaseHandler
import piston.utils
import server.models
import server.utils
import server.common
import rest.utils
from piston.utils import require_mime
import django.core.urlresolvers

class PreferencesHandler(BaseHandler):
    allowed_methods = ['GET']
    model = server.models.Preferences
    exclude = ('_state')
    
    def read(self, request, id=None):
        user = rest.utils.get_rest_user(request)
        try:
            if id:
                preferences = server.models.Prefences.objects.get(id=id)
                return location
            else:
                return server.models.Preferences.objects.all()
        except server.models.Person.DoesNotExist:
            return piston.utils.rc.NOT_FOUND
        except server.models.Location.DoesNotExist:
            return piston.utils.rc.NOT_FOUND
        
    @classmethod
    def resource_uri(*args, **kwargs):
        return ('preferences_handler', ['id',])
