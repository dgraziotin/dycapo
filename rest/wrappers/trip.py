from piston.handler import BaseHandler
import piston.utils
import server.models
import server.utils
import server.common
import rest.utils
from piston.utils import require_mime
import django.core.urlresolvers

class TripHandler(BaseHandler):
    allowed_methods = ['GET','POST','PUT']
    model = server.models.Trip
    fields = ('id', 'published', 'updated', 'expires', 'author', 'locations',
              'mode', 'preferences')

    def read(self, request, id=None):
        if not id:
            trips = server.models.Trip.objects.filter(active=True)
            return trips
        else:
            try:
                trip = server.models.Trip.objects.get(id=id)
                return trip
            except server.models.Trip.DoesNotExist:
                return piston.utils.rc.NOT_FOUND
            
    def create(self, request, id=None):
        data = request.data
        
        source = server.models.Location()
        dict_source = rest.utils.get_location_from_array(data['locations'],"orig")
        dict_source = rest.utils.clean_ids(dict_source)
        source = rest.utils.populate_object_from_dictionary(source, dict_source)

        destination = server.models.Location()
        dict_destination = rest.utils.get_location_from_array(data['locations'],"dest")
        dict_destination = rest.utils.clean_ids(dict_destination)
        destination = rest.utils.populate_object_from_dictionary(destination, dict_destination)
        
        mode = server.models.Mode()
        dict_mode = rest.utils.clean_ids(data['mode'])
        mode = rest.utils.populate_object_from_dictionary(mode, dict_mode)
        mode.vacancy = data['mode']['vacancy']

        preferences = server.models.Preferences()
        dict_preferences = rest.utils.clean_ids(data['preferences'])
        preferences = rest.utils.populate_object_from_dictionary(preferences, dict_preferences)
        
        trip = server.models.Trip()
        dict_trip = rest.utils.clean_ids(data)
        trip = rest.utils.populate_object_from_dictionary(trip, dict_trip)
        
        author = rest.utils.get_rest_user(request)
        result = server.driver.insertTrip(trip, author, source, destination, mode, preferences)
        if result.code == server.models.Response.CREATED:
            trip = server.models.Trip.objects.get(id=result.value['id'])
            return trip
        return result.to_xmlrpc() #rest.utils.extract_result_from_response(result)
    
    @classmethod
    def resource_uri(*args, **kwargs):
        return ('trip_handler', ['id',])

"""  
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
"""