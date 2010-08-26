"""
   Copyright 2010 Daniel Graziotin <daniel.graziotin@acm.org>

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
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
        self.preferences = None
        self.modality = None
        self.author = None
        self.locations = None

    def to_xmlrpc(self):
        if not self.modality:
            modality = {}
        else:
            modality = self.modality.__dict__
        if not self.author:
            author = {}
        else:
            author = self.author.__dict__
        if not self.preferences:
            preferences = {}
        else:
            preferences = self.preferences.__dict__
        if not self.locations:
            locations = {}
        else:
            locations = [location.to_xmlrpc() for location in self.locations]

        return {
            "expires" : self.expires,
            "author" : author,
            "preferences" : preferences,
            "modality" : modality,
            "locations": locations
        }


class Modality():
    def __init__(self,kind='auto',capacity=4,lic='',color='',make='Ford',vacancy=4,cost=0,model='Fiesta'):
        self.kind = kind
        self.capacity = capacity
        self.lic = lic
        self.color = color
        self.make = make
        self.vacancy = vacancy
        self.cost = cost
        self.model = model

class Preferences():
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
        response = self.client.dycapo.setPosition(location)
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
        response = self.client.dycapo.getPosition(person)
        if not type(response['value']) is type(True):
            self.position = Location()
            self.position.__dict__.update(response['value'])
        print "Dycapo Response: \n" + str(response)
        print "#" * 80
        return response

    def finish_trip(self,trip=None):
        print "#" * 80
        print "DELETING TRIP..."
        print "#" * 80
        if not trip:
            trip = self.trip
        response = self.client.dycapo.finishTrip(trip)
        print "#" * 80
        return response

class Driver(Person):
    def insert_trip(self):
        source = Location(georss_point=self.position.georss_point,point='orig')
        destination = self.destination
        modality = Modality()
        preferences = Preferences()
        trip = Trip()
        trip.expires = utils.nowplusdays(3)
        print "initializing Trip from " + self.position.georss_point + " to " + self.destination.georss_point
        print "#" * 80
        print self.username + ": SAVING TRIP..."
        print "#" * 80
        response = self.client.dycapo.insertTrip(trip.__dict__,modality.__dict__,preferences.__dict__,source.__dict__,destination.__dict__)
        print "Dycapo Response: \n" + str(response)
        print "#" * 80
        self.trip = utils.extract_response(response)
        print response
        return response

    def insert_trip_exp(self):
        source = Location(georss_point=self.position.georss_point,point='orig')
        destination = self.destination
        modality = Modality()
        preferences = Preferences()
        trip = Trip()
        trip.expires = utils.nowplusdays(3)
        trip.modality = modality
        trip.preferences = preferences
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
        response = self.client.dycapo.insertTrip(trip.to_xmlrpc())
        print "Dycapo Response: \n" + str(response)
        print "#" * 80
        self.trip = utils.extract_response(response)
        print response
        return response

    def start_trip(self,trip=None):
        print "#" * 80
        print self.username + ": STARTING TRIP..."
        print "#" * 80
        if not trip:
            trip = self.trip
        response = self.client.dycapo.startTrip(trip)
        print response
        print "#" * 80
        return response

    def check_ride_requests(self,trip=None):
        print "#" * 80
        print self.username + ": SEARCHING FOR RIDERS..."
        print "#" * 80
        if not trip:
            trip = self.trip
        response = self.client.dycapo.getRides(trip)
        print "Dycapo Response: \n" + str(response)
        print "#" * 80
        return response

    def accept_ride_request(self,person):
        print "#" * 80
        print self.username + ": ACCEPTING A RIDE REQUEST..."
        print "#" * 80
        response = self.client.dycapo.acceptRide(self.trip,person)
        print "Dycapo Response: \n" + str(response)
        print "#" * 80
        return response

    def refuse_ride_request(self,person):
        print "#" * 80
        print self.username + ": ACCEPTING A RIDE REQUEST..."
        print "#" * 80
        response = self.client.dycapo.refuseRide(self.trip,person)
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
        response = self.client.dycapo.searchRide(position.__dict__,destination.__dict__)
        print "Dycapo Response: \n" + str(response)
        print "*" * 80
        return response

    def request_ride(self,trip):
        print "*" * 80
        print self.username + ": REQUESTING A RIDE..."
        print "*" * 80
        response = self.client.dycapo.requestRide(trip)
        print "Dycapo Response: \n" + str(response)
        return response

    def check_requested_ride(self,trip):
        print "*" * 80
        print self.username + ": CHECK REQUESTED RIDE..."
        print "*" * 80
        response = self.client.dycapo.statusRequestedRide(trip)
        print "Dycapo Response: \n" + str(response)
        return response

    def cancel_requested_ride(self,trip):
        print "*" * 80
        print self.username + ": CANCELLING A RIDE REQUEST..."
        print "*" * 80
        response = self.client.dycapo.cancelRide(trip)
        print "Dycapo Response: \n" + str(response)
        return response

    def start_ride(self,trip):
        print "*" * 80
        print self.username + ": STARTING A RIDE..."
        print "*" * 80
        response = self.client.dycapo.startRide(trip)
        print "Dycapo Response: \n" + str(response)
        return response

    def finish_ride(self,trip):
        print "*" * 80
        print self.username + ": FINISHING A RIDE..."
        print "*" * 80
        response = self.client.dycapo.finishRide(trip)
        print "Dycapo Response: \n" + str(response)
        return response
