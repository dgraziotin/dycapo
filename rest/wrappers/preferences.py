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
    fields = ("nonsmoking",
        "gender",
        "ride",
        "drive",
        "id",
        "age","href")
    
    def read(self, request, id=None):
        user = rest.utils.get_rest_user(request)
        try:
            if id:
                preferences = server.models.Preferences.objects.get(id=id)
                return preferences
            else:
                return server.models.Preferences.objects.all()
        except server.models.Preferences.DoesNotExist:
            return piston.utils.rc.NOT_FOUND