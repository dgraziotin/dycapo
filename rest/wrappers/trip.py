from piston.handler import BaseHandler
import piston.utils
import server.models
import server.utils
import server.common
import rest.utils
from piston.utils import require_mime
import django.core.urlresolvers

class TripHandler(BaseHandler):
    allowed_methods = ['GET','POST','DELETE']
    model = server.models.Trip
    fields = ('id', 'published', 'updated', 'expires', 'author', 'locations',
              'mode', 'preferences', 'active')

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

    def update(self, request, id=None):
        current_user = rest.utils.get_rest_user(request)
        data = request.data
        try:
            trip = server.models.Trip.objects.get(id=id)
            if trip.author.id != current_user.id:
                return piston.utils.rc.FORBIDDEN
            if trip.active:
                return piston.utils.rc.FORBIDDEN
            result = server.driver.startTrip(trip, current_user)
            return rest.utils.extract_result_from_response(result)
        except server.models.Trip.DoesNotExist:
            return piston.utils.rc.NOT_FOUND
        except Exception, e:
            rc = piston.utils.rc.BAD_REQUEST
            rc.write(str(e))
            return rc

    def delete(self, request, id=None):
        current_user = rest.utils.get_rest_user(request)
        try:
            trip = server.models.Trip.objects.get(id=id, active=True)
            if trip.author.id != current_user.id:
                return piston.utils.rc.FORBIDDEN
            result = server.driver.finishTrip(trip, current_user)
            return rest.utils.extract_result_from_response(result)
        except server.models.Trip.DoesNotExist:
            return piston.utils.rc.NOT_FOUND
        except Exception, e:
            rc = piston.utils.rc.BAD_REQUEST
            rc.write(str(e))
            return rc

    @classmethod
    def resource_uri(*args, **kwargs):
        return ('trip_handler', ['id',])
