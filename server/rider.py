"""
This file is part of Dycapo.
    Copyright (C) 2009, 2010 FBK Foundation, (http://www.fbk.eu)
    Authors: SoNet Group (see AUTHORS)
    Dycapo is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Dycapo is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with Dycapo.  If not, see <http://www.gnu.org/licenses/>.

"""
"""
This module holds all the XML-RPC methods that a Rider needs.
"""
import datetime
import geopy
import matching
import models
import response_codes
import rpc4django
import utils

@rpc4django.rpcmethod(name='dycapo.search_trip',
                      signature=['Response', 'Location', 'Location'],
                      permission='server.can_xmlrpc')
def search_trip(source, destination, ** kwargs):
    """
        This method is used by a rider to search a Trip,
        given its current position and the destination.

        TODO

        - verify user permissions
        - verify trip vacancy

        PARAMETERS

        - ``source`` - a **Location** object, representing where
        the Rider is located
        - ``destination`` - a **Location** object, representing where
        the Rider wants to go to

        RETURNS

        An object of type **Response**, containing all the details of
        the operation and results (if any)
        """
    dict_destination = destination
    destination = models.Location()
    destination = utils.populate_object_from_dictionary(destination,
                                                        dict_destination)
    destination.complete_fields()

    rider = utils.get_xmlrpc_user(kwargs)

    trips_common_destination = matching.get_trips_destination_near_location(
                                                                            destination)
    
    if not trips_common_destination:
        return models.Response(response_codes.NEGATIVE,
                               response_codes.RIDES_NOT_FOUND,
                               "boolean", False).to_xmlrpc()

    trips_driver_farther_driver = matching.exclude_trips_driver_closest_to_destination(
                                                                                       trips_common_destination, rider)

    if not trips_driver_farther_driver:
        return models.Response(response_codes.NEGATIVE,
                               response_codes.RIDES_NOT_FOUND,
                               "boolean", False).to_xmlrpc()

    trips = matching.exclude_trips_driver_not_approaching_rider(
                                                                trips_driver_farther_driver, rider)

    if not trips:
        return models.Response(response_codes.NEGATIVE,
                               response_codes.RIDES_NOT_FOUND,
                               "boolean", False).to_xmlrpc()

    return models.Response(response_codes.POSITIVE,
                           response_codes.RIDES_FOUND,
                           "Trip", [trip.to_xmlrpc() for trip in trips]).to_xmlrpc()

@rpc4django.rpcmethod(name='dycapo.request_ride',
                      signature=['Response', 'Trip'],
                      permission='server.can_xmlrpc')
def request_ride(trip, ** kwargs):
    """
        This method is for a rider to request a Ride in a Trip.

        TODO

        - verify user permissions
        - check if there is vacancy in the current trip
        - check if the trip is not expired

        PARAMETERS

        - ``trip`` - a **Trip** object, representing the Trip that the Rider
        would like to join.

        RETURNS

        An object of type **Response**, containing all the details of the
        operation and results (if any)
        """
    trip_dict = trip
    try:
        trip = models.Trip.objects.get(id=trip_dict['id'])
    except KeyError:
        resp = models.Response(response_codes.ERROR,
                               response_codes.TRIP_NOT_FOUND,
                               "boolean", False)
        return resp.to_xmlrpc()
    rider = utils.get_xmlrpc_user(kwargs)

    participation = models.Participation()
    participation.trip = trip
    participation.person = rider
    participation.role = 'rider'
    participation.requested = True
    participation.requested_timestamp = datetime.datetime.now()

    try:
        participation.requested_position = rider.position
    except models.Location.DoesNotExist:
        participation.requested_position = None
    try:
        participation_check = models.Participation.objects.get(
                                                               trip=trip, person=rider)
        participation_check = utils.synchronize_objects(
                                                        participation_check, participation)
        participation_check.save()
    except models.Participation.DoesNotExist:
        participation.save()
        resp = models.Response(response_codes.POSITIVE,
                               response_codes.RIDE_REQUESTED,
                               "boolean", True)
        return resp.to_xmlrpc()
    resp = models.Response(response_codes.ERROR,
                           response_codes.RIDE_IN_COURSE,
                           "boolean", False)
    return resp.to_xmlrpc()

@rpc4django.rpcmethod(name='dycapo.start_ride',
                      signature=['Response', 'Trip'],
                      permission='server.can_xmlrpc')
def start_ride(trip, **kwargs):
    """
        This method is for a rider to start a Ride. It must be called from the
        client when the Driver arrives to take the Rider.

        TODO

        - verify user permissions

        PARAMETERS

        - ``trip`` - a **Trip** object, representing the Trip that the Rider
        would like to join.

        RETURNS

        An object of type **Response**, containing all the details of the
        operation and results (if any)
        """
    trip_dict = trip
    try:
        trip = models.Trip.objects.get(id=trip_dict['id'])
    except (KeyError,models.Trip.DoesNotExist):
        resp = models.Response(response_codes.ERROR,
                               response_codes.TRIP_NOT_FOUND,
                               "boolean", False)
        return resp.to_xmlrpc()

    rider = utils.get_xmlrpc_user(kwargs)
    try:
        participation = trip.get_participations().filter(person=rider)[0]
        participation.started = True
        participation.started_timestamp = datetime.datetime.now()
        participation.started_position = rider.position
        participation.save()
        trip.update_vacancy()
    except Exception, e:
        resp = models.Response(response_codes.ERROR,
                               response_codes.TRIP_NOT_FOUND,
                               "string", [str(e)])
        return resp.to_xmlrpc()
    resp = models.Response(response_codes.POSITIVE,
                               response_codes.RIDE_STARTED,
                               "boolean", True)
    return resp.to_xmlrpc()

@rpc4django.rpcmethod(name='dycapo.finish_ride',
                      signature=['Response', 'Trip'],
                      permission='server.can_xmlrpc')
def finish_ride(trip, **kwargs):
    """
        This method is for a rider to finish a Ride. It must be called from the
        client when the Rider exits the car.

        TODO

        - verify user permissions

        PARAMETERS

        - ``trip`` - a **Trip** object, representing the Trip that the Rider
        would like to join.

        RETURNS

        An object of type **Response**, containing all the details of the
        operation and results (if any)
        """
    trip_dict = trip
    try:
        trip = models.Trip.objects.get(id=trip_dict['id'])
    except KeyError:
        resp = models.Response(response_codes.ERROR,
                               response_codes.TRIP_NOT_FOUND,
                               "boolean", False)
        return resp.to_xmlrpc()

    rider = utils.get_xmlrpc_user(kwargs)

    participation = trip.get_participations().filter(person=rider)[0]
    participation.finished = True
    participation.finished_timestamp = datetime.datetime.now()
    participation.finished_position = rider.position
    participation.save()
    trip.update_vacancy()
    resp = models.Response(response_codes.POSITIVE,
                               response_codes.RIDE_STARTED,
                               "boolean", True)
    return resp.to_xmlrpc()
