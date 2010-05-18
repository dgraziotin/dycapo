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
This module holds all the XML-RPC methods that a Driver needs.
"""
import datetime
import models
import response_codes
import rpc4django
import utils

@rpc4django.rpcmethod(name='dycapo.add_trip',
                      signature=['Response', 'Trip', 'Mode', 'Prefs',
                      'Location', 'Location'],
                      permission='server.can_xmlrpc')
def add_trip(trip, mode, preferences, source, destination, ** kwargs):
        
    """ Inserts a new Trip in Dycapo System. It supports a source, a
        destination and the trip mode. See the models for more information.
        
        TODO
        
        - verify user permissions
        - multiple waypoints
    
        PARAMETERS
    
        - ``trip`` - a **Trip** object, representing the Trip that the Driver
                is willing to save
        - ``mode`` - a **Mode** object, representing the modalities of the Trip
        - ``preferences`` - a **Prefs** object, representing the
        Trip preferences
        - ``source`` - a **Location** object, representing where the Trip will
        start.
        - ``destination`` - a **Location** object, representing where the Trip
        will end.
    
        RETURNS 
    
        An object of type **Response**, containing all the details of the
                operation and results (if any)
        """
        
    dict_trip = utils.clean_ids(trip)
    dict_mode = utils.clean_ids(mode)
    dict_prefs = utils.clean_ids(preferences)
    dict_source = utils.clean_ids(source)
    dict_destination = utils.clean_ids(destination)
        
    driver = utils.get_xmlrpc_user(kwargs)
        
    source = models.Location()
    source = utils.populate_object_from_dictionary(source, dict_source)
        
        
    destination = models.Location()
    destination = utils.populate_object_from_dictionary(destination,
                                                        dict_destination)
        
    mode = models.Mode()
    mode = utils.populate_object_from_dictionary(mode, dict_mode)
    
        
    preferences = models.Prefs()
    preferences = utils.populate_object_from_dictionary(preferences,
                                                        dict_prefs)
        
    try:
        source.save()
        destination.save()
        mode.save()
        preferences.save()
    except Exception, e:
        resp = models.Response(response_codes.NEGATIVE, str(e), "boolean",
                               False)
        return resp.to_xmlrpc()
    trip = models.Trip()
    trip = utils.populate_object_from_dictionary(trip, dict_trip)
    trip.author = driver
    trip.mode = mode
    trip.prefs = preferences
    try:
        trip.save()
    except Exception, e:
        resp = models.Response(response_codes.NEGATIVE, str(e), "boolean",
                               False)
        return resp.to_xmlrpc()
        
    trip.locations.add(source)
    trip.locations.add(destination)
    

    participation = models.Participation()
    participation.person = driver
    participation.trip = trip
    participation.role = 'driver'
    participation.save()
    trip_stored = models.Trip.objects.get(id=trip.id)
    resp = models.Response(response_codes.POSITIVE,
                           response_codes.TRIP_INSERTED, "Trip",
                           trip_stored.to_xmlrpc())
    return resp.to_xmlrpc()

@rpc4django.rpcmethod(name='dycapo.start_trip',
                      signature=['Response', 'Trip'],
                      permission='server.can_xmlrpc')
def start_trip(trip, ** kwargs):
    """
        Starts a Trip
        
        TODO
        
        - verify user permissions
    
        PARAMETERS
    
        - ``trip`` - a **Trip** object, representing the Trip that the Driver
        is starting
    
        RETURNS 
    
        An object of type **Response**, containing all the details
        of the operation and results (if any)
        """
        
    trip_dict = trip
    try:
        trip = models.Trip.objects.get(id=trip_dict['id'])
    except models.Trip.DoesNotExist:
        resp = models.Response(response_codes.NEGATIVE,
                               response_codes.TRIP_NOT_FOUND,
                               "Trip", trip_dict)
        return resp.to_xmlrpc()
    except KeyError:
        resp = models.Response(response_codes.NEGATIVE,
                               response_codes.TRIP_NOT_FOUND,
                               "boolean", False)
        return resp.to_xmlrp()
        
    participation = models.Participation.objects.get(trip=trip,
                                                     role='driver')
    driver = utils.get_xmlrpc_user(kwargs)
        
    # return False if the driver already started this trip
    if participation.started:
        resp = models.Response(response_codes.NEGATIVE,
                               response_codes.TRIP_ALREADY_STARTED,
                               "boolean", False)
        return resp.to_xmlrpc()
        
    participation.started = True
    participation.started_timestamp = datetime.datetime.now()
    try:
        participation.started_position = driver.position
    except models.Location.DoesNotExist:
        participation.started_position = None
    participation.save()
    trip.active = True
    trip.save()
        
    resp = models.Response(response_codes.POSITIVE,
                           response_codes.TRIP_STARTED, "boolean", True)
    return resp.to_xmlrpc()


@rpc4django.rpcmethod(name='dycapo.check_ride_requests',
                      signature=['Response', 'Trip'],
                      permission='server.can_xmlrpc')
def check_ride_requests(trip, ** kwargs):
    """
        This method is for a driver to see if there are ride requests
        for his Trip
        
        TODO
        
        -verify user permissions
        
        PARAMETERS
    
        - ``trip`` - a **Trip** object, representing the Trip that the
        Driver is checking
    
        RETURNS 
    
        An object of type **Response**, containing all the details of the
        operation and results (if any)
        """
        
    trip_dict = trip

    try:
        trip = models.Trip.objects.get(id=trip_dict['id'])
    except models.Trip.DoesNotExist:
        resp = models.Response(response_codes.NEGATIVE,
                               response_codes.TRIP_NOT_FOUND,
                               "Trip", trip_dict)
        return resp.to_xmlrpc()
    except KeyError:
        resp = models.Response(response_codes.NEGATIVE,
                               response_codes.TRIP_NOT_FOUND,
                               "boolean", False)
        return resp.to_xmlrpc()
            
    driver = utils.get_xmlrpc_user(kwargs)

    participations_for_trip = models.Participation.objects.filter(
                                                                  trip=trip).exclude(person=driver)

    if len(participations_for_trip) == 0:
        resp = models.Response(response_codes.NEGATIVE,
                               response_codes.RIDE_REQUESTS_NOT_FOUND,
                               "boolean", False)
        return resp.to_xmlrpc()
    else:
        for participation in participations_for_trip:
            if participation.requested:
                resp = models.Response(response_codes.POSITIVE,
                                       response_codes.RIDE_REQUESTS_FOUND,
                                       "Person",
                                       participation.person.to_xmlrpc())
                return resp.to_xmlrpc()
                            
    resp = models.Response(response_codes.NEGATIVE,
                           response_codes.RIDE_REQUESTS_NOT_FOUND,
                           "boolean", False)
    return resp.to_xmlrpc()


@rpc4django.rpcmethod(name='dycapo.accept_ride_request',
                      signature=['Response', 'Trip', 'Person'],
                      permission='server.can_xmlrpc')
def accept_ride_request(trip, person, ** kwargs):
        
    """
        This method is for a driver to accept a ride request by a rider.
        
        TODO
        
        -verify user permissions
    
        PARAMETERS
    
        - ``trip`` - a **Trip** object, representing the Trip in which
        the Driver is accepting a ride.
        - ``person`` - a **Person** object, representing the Rider that
        the Driver is accepting
    
        RETURNS 
    
        An object of type **Response**, containing all the details of the
        operation and results (if any)
        """

    trip_dict = trip
    person_dict = person
        
    try:
        trip = models.Trip.objects.get(id=trip_dict['id'])
    except models.Trip.DoesNotExist:
        resp = models.Response(response_codes.ERROR,
                               response_codes.TRIP_NOT_FOUND,
                               "Trip", trip_dict)
        return resp.to_xmlrpc()
        
    try:
        rider = models.Person.objects.get(username=person_dict['username'])
    except models.Person.DoesNotExist:
        resp = models.Response(response_codes.ERROR,
                               response_codes.PERSON_NOT_FOUND,
                               "Person", person_dict)
        return resp.to_xmlrpc()
    except KeyError:
        resp = models.Response(response_codes.ERROR,
                               response_codes.TRIP_NOT_FOUND,
                               "boolean", False)
        return resp.to_xmlrpc()
        
    try:
        rider_participation = models.Participation.objects.get(trip=trip,
                                                               person=rider)
    except models.Participation.DoesNotExist:
        resp = models.Response(response_codes.ERROR,
                               response_codes.PERSON_NOT_FOUND,
                               "boolean", False)
        return resp.to_xmlrpc()
    if rider_participation.requested and not rider_participation.accepted:
        rider_participation.accepted = True
        rider_participation.accepted_timestamp = datetime.datetime.now()
        try:
            rider_participation.accepted_position = rider.position
        except models.Location.DoesNotExist:
            rider_participation.accepted_position = None
                
        rider_participation.save()
        resp = models.Response(response_codes.POSITIVE,
                               response_codes.RIDE_REQUEST_ACCEPTED,
                               "boolean", True)
        return resp.to_xmlrpc()
        
    resp = models.Response(response_codes.NEGATIVE,
                           response_codes.RIDE_REQUEST_REFUSED,
                           "boolean", False)
    return resp.to_xmlrpc()

        

@rpc4django.rpcmethod(name='dycapo.finish_trip',
                      signature=['Response', 'Trip'],
                      permission='server.can_xmlrpc')
def finish_trip(trip, ** kwargs):
        
    """
        This method is for a driver to close a Trip.
        
        TODO
        
        -verify user permissions
    
        PARAMETERS
    
        - ``trip`` - a **Trip** object, representing the Trip that the driver
        is closing
    
        RETURNS 
    
        An object of type **Response**, containing all the details of the
        operation and results (if any)
        """
        
    trip_dict = trip
    trip = models.Trip.objects.get(id=trip_dict['id'])
    driver = utils.get_xmlrpc_user(kwargs)
    if driver.is_participating():
        participation = driver.get_active_participation()
        participation.finished = True
        participation.finished_timestamp = utils.now()
        participation.save()
    trip.active = False
    trip.save()
        
    resp = models.Response(response_codes.POSITIVE,
                           response_codes.TRIP_DELETED,
                           "boolean", True)
    return resp.to_xmlrpc()
        