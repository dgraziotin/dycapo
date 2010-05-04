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
from rpc4django import rpcmethod
from models import Trip, Location, Person, Participation, Response
from datetime import datetime
from utils import populate_object_from_dictionary, synchronize_objects, get_xmlrpc_user
import response_codes

@rpcmethod(name='dycapo.search_trip', signature=['Response','Location','Location'], permission='server.can_xmlrpc')
def search_trip(source, destination, **kwargs):
        """
        This method is used by a rider to search a Trip, given its current position and the destination.
        
        TODO
        
        - verify user permissions
        - implement an algorithm to really search a Trip :)
        - verify trip vacancy
    
        PARAMETERS
    
        - ``source`` - a **Location** object, representing where the Rider is located
        - ``destination`` - a **Location** object, representing where the Rider wants to go to
    
        RETURNS 
    
        An object of type **Response**, containing all the details of the operation and results (if any)
        """
        dict_destination = destination
        destination = Location()
        destination = populate_object_from_dictionary(destination,dict_destination)
        destination.point_to_address()
        user = get_xmlrpc_user(kwargs)
       
        lat_delta = 0.00265800000001
        lon_delta = 0.00818400000001
        
        lat_max = destination.georss_point_latitude + lat_delta
        lat_min = destination.georss_point_latitude - lat_delta
        lon_max = destination.georss_point_longitude + lon_delta
        lon_min = destination.georss_point_longitude - lon_delta

        trips_similar_destination = Trip.objects.filter(
                    active=True,
                    locations__point='dest',
                    locations__georss_point_latitude__range=(lat_min,lat_max),
                    locations__georss_point_longitude__range=(lon_min,lon_max)
        )    
        
        if not trips_similar_destination:
            return Response(response_codes.NEGATIVE,response_codes.RIDES_NOT_FOUND,"boolean",False)
        else:
            return Response(response_codes.POSITIVE,response_codes.RIDES_FOUND,"Trip",[trip.to_xmlrpc() for trip in trips_similar_destination])
            
        
@rpcmethod(name='dycapo.request_ride', signature=['Response','Trip'], permission='server.can_xmlrpc')
def request_ride(trip, **kwargs):
        """
        This method is for a rider to request a Ride in a Trip.
        
        TODO
        
        - verify user permissions
        - check if there is vacancy in the current trip
        - check if the trip is not expired
    
        PARAMETERS
    
        - ``trip`` - a **Trip** object, representing the Trip that the Rider would like to join.
    
        RETURNS 
    
        An object of type **Response**, containing all the details of the operation and results (if any)
        """
        trip_dict = trip
        try:
            trip = Trip.objects.get(id=trip_dict['id'])
        except KeyError:
            resp = Response(response_codes.ERROR,response_codes.TRIP_NOT_FOUND,"boolean",False)
            return resp.to_xmlrpc()
        rider = get_xmlrpc_user(kwargs)
        
        participation = Participation()
        participation.trip = trip
        participation.person = rider
        participation.role = 'rider'
        participation.requested = True
        participation.requested_timestamp = datetime.now()
        try:
            participation.requested_position = rider.position
        except Location.DoesNotExist:
            participation.requested_position = None
        try:
                participation_check = Participation.objects.get(trip=trip,person=rider)
                participation_check = synchronize_objects(participation_check,participation)
                participation_check.save()
        except Participation.DoesNotExist:
                participation.save()
                resp = Response(response_codes.POSITIVE,response_codes.RIDE_REQUESTED,"boolean",True)
                return resp.to_xmlrpc()
        resp = Response(response_codes.ERROR,response_codes.RIDE_IN_COURSE,"boolean",True)
        return resp.to_xmlrpc()