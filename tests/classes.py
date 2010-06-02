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

import utils
class Location():
    def __init__(self,point='posi',georss_point='',label='Work',postcode=0,leaves=utils.now()):
        self.point = point
        self.georss_point = georss_point
        self.offset = 30
        self.label = label
        self.postcode = postcode
        self.leaves = leaves
    def to_xmlrpc(self):
        return self.__dict__

class Trip():
    def __init__(self,expires=utils.now):
        self.expires = expires
        self.prefs = None
        self.mode = None
        self.author = None
        self.locations = None

    def to_xmlrpc(self):
        if not self.mode:
            mode = {}
        else:
            mode = self.mode.__dict__
        if not self.author:
            author = {}
        else:
            author = self.author.__dict__
        if not self.prefs:
            prefs = {}
        else:
            prefs = self.prefs.__dict__
        if not self.locations:
            locations = {}
        else:
            locations = [location.to_xmlrpc() for location in self.locations]

        return {
            "expires" : self.expires,
            "content" : {
                "author" : author,
                "prefs" : prefs,
                "mode" : mode,
                "locations": locations
            }
        }


class Mode():
    def __init__(self,kind='auto',capacity=4,lic='',color='',make='Ford',vacancy=4,cost=0,model='Fiesta'):
        self.kind = kind
        self.capacity = capacity
        self.lic = lic
        self.color = color
        self.make = make
        self.vacancy = vacancy
        self.cost = cost
        self.model = model

class Prefs():
    def __init__(self,age='18-30',nonsmoking=False):
        self.age = age
        self.nonsmoking = nonsmoking

class Response(object):
    """
    This is an envelope that standardizes the response of Dycapo. This is an OpenTrip Dynamic proposal.
    """
    def __init__(self,code=-1,message="",type="",value=None):
        self.code = code
        self.message = message
        self.type = type
        self.value = value

class Person():
    def __init__(self,username,password,domain,position=Location(),destination=Location(),clean_responses=True):
        self.clean_responses = clean_responses
        self.position = position
        self.destination = destination
        self.username = username
        self.password = password
        self.domain = domain
        self.client = utils.get_xmlrpc_client(username,password, domain)
        self.trip = None

    def change_password(self,password):
        self.password = password
        self.client = utils.get_xmlrpc_client(self.username,self.password, self.domain)

    def register(self):
        print "#" * 80
        print self.username + ": REGISTERING TO THE SYSTEM..."
        print "#" * 80
        if not location:
            location = self.position
        response = self.client.dycapo.register()
        print "Dycapo Response: \n" + str(response)
        print "#" * 80
        return response

    def update_position(self,location=None):
        print "#" * 80
        print self.username + ": UPDATING POSITION..."
        print "#" * 80
        if not location:
            location = self.position
        response = self.client.dycapo.update_position(location)
        print "Dycapo Response: \n" + str(response)
        print "#" * 80
        return response

    def get_position(self,person=None):
        print "#" * 80
        print self.username + ": GETTING POSITION..."
        print "#" * 80

        if not person:
            person = self

        person = {'username':person.username}
        response = self.client.dycapo.get_position(person)
        print "Dycapo Response: \n" + str(response)
        print "#" * 80
        return response

    def finish_trip(self,trip=None):
        print "#" * 80
        print "DELETING TRIP..."
        print "#" * 80
        if not trip:
            trip = self.trip
        response = self.client.dycapo.finish_trip(trip)
        print "#" * 80
        return response

class Driver(Person):
    def insert_trip(self):
        source = Location(georss_point=self.position.georss_point,point='orig')
        destination = self.destination
        mode = Mode()
        prefs = Prefs()
        trip = Trip()
        trip.expires = utils.nowplusdays(3)
        print "initializing Trip from " + self.position.georss_point + " to " + self.destination.georss_point
        print "#" * 80
        print self.username + ": SAVING TRIP..."
        print "#" * 80
        response = self.client.dycapo.add_trip(trip.__dict__,mode.__dict__,prefs.__dict__,source.__dict__,destination.__dict__)
        print "Dycapo Response: \n" + str(response)
        print "#" * 80
        self.trip = utils.extract_response(response)
        return response

    def insert_trip_exp(self):
        source = Location(georss_point=self.position.georss_point,point='orig')
        destination = self.destination
        mode = Mode()
        prefs = Prefs()
        trip = Trip()
        trip.expires = utils.nowplusdays(3)
        trip.mode = mode
        trip.prefs = prefs
        trip.locations = [source, destination]
        class person():
            pass
        author = person()
        author.username = self.username
        trip.author = author
        print "initializing Trip from " + self.position.georss_point + " to " + self.destination.georss_point
        print "trip: " + str(trip.to_xmlrpc())
        print "#" * 80
        print self.username + ": SAVING TRIP EXP..."
        print "#" * 80
        response = self.client.dycapo.add_trip_exp(trip.to_xmlrpc())
        print "Dycapo Response: \n" + str(response)
        print "#" * 80
        self.trip = utils.extract_response(response)
        return response

    def start_trip(self,trip=None):
        print "#" * 80
        print self.username + ": STARTING TRIP..."
        print "#" * 80
        if not trip:
            trip = self.trip
        response = self.client.dycapo.start_trip(trip)
        print response
        print "#" * 80
        return response

    def check_ride_requests(self,trip=None):
        print "#" * 80
        print self.username + ": SEARCHING FOR RIDERS..."
        print "#" * 80
        if not trip:
            trip = self.trip
        response = self.client.dycapo.check_ride_requests(trip)
        print "Dycapo Response: \n" + str(response)
        print "#" * 80
        return response

    def accept_ride_request(self,person):
        print "#" * 80
        print self.username + ": ACCEPTING A RIDE REQUEST..."
        print "#" * 80
        response = self.client.dycapo.accept_ride_request(self.trip,person)
        print "Dycapo Response: \n" + str(response)
        print "#" * 80
        return response

    def refuse_ride_request(self,person):
        print "#" * 80
        print self.username + ": ACCEPTING A RIDE REQUEST..."
        print "#" * 80
        response = self.client.dycapo.refuse_ride_request(self.trip,person)
        print "Dycapo Response: \n" + str(response)
        print "#" * 80
        return response

class Rider(Person):
    def search_ride(self,position=None,destination=None):
        if not position:
            position = self.position
        if not destination:
            destination = self.destination
        print "*" * 80
        print self.username + ": SEARCHING FOR A RIDE from " + position.georss_point + " to " + destination.georss_point
        print "*" * 80
        response = self.client.dycapo.search_trip(position.__dict__,destination.__dict__)
        print "Dycapo Response: \n" + str(response)
        print "*" * 80
        return response

    def request_ride(self,trip):
        print "*" * 80
        print self.username + ": REQUESTING A RIDE..."
        print "*" * 80
        response = self.client.dycapo.request_ride(trip)
        print "Dycapo Response: \n" + str(response)
        return response

    def check_requested_ride(self,trip):
        print "*" * 80
        print self.username + ": CHECK REQUESTED RIDE..."
        print "*" * 80
        response = self.client.dycapo.check_requested_ride(trip)
        print "Dycapo Response: \n" + str(response)
        return response

    def cancel_requested_ride(self,trip):
        print "*" * 80
        print self.username + ": CANCELLING A RIDE REQUEST..."
        print "*" * 80
        response = self.client.dycapo.cancel_requested_ride(trip)
        print "Dycapo Response: \n" + str(response)
        return response

    def start_ride(self,trip):
        print "*" * 80
        print self.username + ": STARTING A RIDE..."
        print "*" * 80
        response = self.client.dycapo.start_ride(trip)
        print "Dycapo Response: \n" + str(response)
        return response

    def finish_ride(self,trip):
        print "*" * 80
        print self.username + ": FINISHING A RIDE..."
        print "*" * 80
        response = self.client.dycapo.finish_ride(trip)
        print "Dycapo Response: \n" + str(response)
        return response
