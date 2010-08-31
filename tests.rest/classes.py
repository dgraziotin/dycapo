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
import json
import urlparse
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
    def __init__(self,kind='auto',capacity=4,lic='',color='',make='Ford',vacancy=4,cost=0,model_name='Fiesta'):
        self.kind = kind
        self.capacity = capacity
        self.lic = lic
        self.color = color
        self.make = make
        self.vacancy = vacancy
        self.cost = cost
        self.model_name = model_name

class Preferences():
    def __init__(self,age='18-30',nonsmoking=False):
        self.age = age
        self.nonsmoking = nonsmoking
        
class Search():
    def __init__(self, origin, destination):
        self.origin = origin
        self.destination = destination
        
    def to_xmlrpc(self):
        return {
            "origin": self.origin.to_xmlrpc(),
            "destination": self.destination.to_xmlrpc()
        }

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
    def __init__(self,username,password,domain,location=Location(),destination=Location(),clean_responses=True):
        self.clean_responses = clean_responses
        self.location = location
        self.destination = destination
        self.username = username
        self.password = password
        self.domain = domain
        self.client = utils.get_rest_client(username,password, domain)
        self.trip = None

    def change_password(self,person):
        self.password = person['password']
        print "#" * 80
        print self.username + ": CHANGING PASSWORD..."
        print "#" * 80
        response = self.client.put('/persons/'+self.username+'/',data=person)
        print "Dycapo Response: \n" + str(response)
        print "#" * 80
        return utils.rest_to_response(response)

    def register(self,person=None):
        print "#" * 80
        print self.username + ": REGISTERING TO THE SYSTEM..."
        print "#" * 80
        response = self.client.post('/persons/',data=person)
        print "Dycapo Response: \n" + str(response)
        print "#" * 80
        return utils.rest_to_response(response)

    def update_position(self,location=None):
        print "#" * 80
        print self.username + ": UPDATING POSITION..."
        print "#" * 80
        if not location:
            location = self.location
        response = self.client.put('/persons/'+self.username+'/location/',data=location.__dict__)
        print "Dycapo Response: \n" + str(response)
        print "#" * 80
        return utils.rest_to_response(response)

    def get_position(self,person=None):
        print "#" * 80
        print self.username + ": GETTING POSITION..."
        print "#" * 80

        if not person:
            response = self.client.get('/persons/'+self.username+'/location/')
            self.location = Location()
            self.location.__dict__.update(response.data)
        else:
            response = self.client.get('/persons/'+person.username+'/location/')
        print "Dycapo Response: \n" + str(response)
        print "#" * 80
        return utils.rest_to_response(response)


    def finish_trip(self,trip=None):
        print "#" * 80
        print "DELETING TRIP..."
        print "#" * 80
        if not trip:
            trip = self.trip
        trip['active'] = False
        response = self.client.put('/trips/'+str(trip['id'])+'/',data=trip)
        print "#" * 80
        return utils.rest_to_response(response)

class Driver(Person):
    def insert_trip(self):
        return self.insert_trip_exp()

    def insert_trip_exp(self):
        source = Location(georss_point=self.location.georss_point,point='orig')
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
        print "initializing Trip from " + self.location.georss_point + " to " + self.destination.georss_point
        print "trip: " + str(trip.to_xmlrpc())
        print "#" * 80
        print self.username + ": SAVING TRIP EXP..."
        print "#" * 80
        response = self.client.post('/trips/',data=trip.to_xmlrpc())
        print "Dycapo Response: \n" + str(response)
        print "#" * 80
        self.trip = utils.extract_response(response)
        print response
        return utils.rest_to_response(response)

    def start_trip(self,trip=None):
        print "#" * 80
        print self.username + ": STARTING TRIP..."
        print "#" * 80
        if not trip:
            trip = self.trip
        trip['active'] = True
        response = self.client.put('/trips/' +str(trip['id'])+ '/', data=trip)
        print response
        print "#" * 80
        return utils.rest_to_response(response)


    def check_ride_requests(self,trip=None):
        print "#" * 80
        print self.username + ": SEARCHING FOR RIDERS..."
        print "#" * 80
        if not trip:
            trip = self.trip
        response = self.client.get('/trips/' +str(trip['id'])+ '/participations/')
        print "Dycapo Response: \n" + str(response)
        print "#" * 80
        response.data = utils.filter_participations(response.data,username=self.username)        
        response = utils.rest_to_response(response)
        print "Dycapo filtered Response: \n" + str(response)
        return response

    def accept_ride_request(self,person):
        print "#" * 80
        print self.username + ": ACCEPTING A RIDE REQUEST..."
        print "#" * 80
        if isinstance(person,str):
            username = person
        else:
            try:
                username = person['username']
            except KeyError:
                username = person['person']['username']
        response = self.client.put('/trips/' +str(self.trip['id'])+ '/participations/'+username+'/',
                                   data={'status':'accept'})
        print "Dycapo Response: \n" + str(response)
        print "#" * 80
        return utils.rest_to_response(response)

    def refuse_ride_request(self,person):
        print "#" * 80
        print self.username + ": REFUSE A RIDE REQUEST..."
        print "#" * 80
        response = self.client.delete('/trips/' +str(self.trip['id'])+ '/participations/'+person['person']['username']+'/')
        print "Dycapo Response: \n" + str(response)
        print "#" * 80
        return utils.rest_to_response(response)

class Rider(Person):
    def search_ride(self,location=None,destination=None):
        if not location:
            location = self.location
        if not destination:
            destination = self.destination
        search = Search(location, destination)
        print "*" * 80
        print self.username + ": SEARCHING FOR A RIDE from " + location.georss_point + " to " + destination.georss_point
        print "*" * 80
        response = self.client.post('/searches/',data=search.to_xmlrpc())
        print "Dycapo Response: \n" + str(response)
        print "*" * 80
        response = utils.rest_to_response(response)
        href = response['value']['href']
        parsed_href = urlparse.urlparse(href)
        path = parsed_href.path[4:]
        response = self.client.get(path)
        return utils.rest_to_response(response)
    
    def request_ride(self,trip):
        print "*" * 80
        print self.username + ": REQUESTING A RIDE..."
        print "*" * 80
        participation = {
            'status' : 'request'
        }
        if isinstance(trip,dict):
            href = trip['href']
        else:
            href = trip.href
        response = self.client.post(str(utils.get_path(href))+"participations/",data=participation)
        print "requesting ride: " + str(utils.get_path(href))+"participations/"
        print "Dycapo Response: \n" + str(response)
        return utils.rest_to_response(response)

    def check_requested_ride(self,trip):
        print "*" * 80
        print self.username + ": CHECK REQUESTED RIDE..."
        print "*" * 80
        if isinstance(trip,dict):
            href = trip['href']
        else:
            href = trip.href
        response = self.client.get(str(utils.get_path(href))+"participations/"+self.username+'/')
        print "Dycapo Response: \n" + str(response)
        return utils.rest_to_response(response)

    def cancel_requested_ride(self,trip):
        print "*" * 80
        print self.username + ": CANCELLING A RIDE REQUEST..."
        print "*" * 80
        if isinstance(trip,dict):
            href = trip['href']
        else:
            href = trip.href
        response = self.client.delete(str(utils.get_path(href))+"participations/"+self.username+'/')
        print "Dycapo Response: \n" + str(response)
        return utils.rest_to_response(response)

    def start_ride(self,trip):
        print "#" * 80
        print self.username + ": STARTING A RIDE..."
        print "#" * 80
        if isinstance(trip,dict):
            href = trip['href']
        else:
            href = trip.href
        response = self.client.put(str(utils.get_path(href))+"participations/"+self.username+'/',
                                   data={'status':'start'})
        print "Dycapo Response: \n" + str(response)
        print "#" * 80
        return utils.rest_to_response(response)

    def finish_ride(self,trip):
        print "#" * 80
        print self.username + ": FINISHING A RIDE..."
        print "#" * 80
        if isinstance(trip,dict):
            href = trip['href']
        else:
            href = trip.href
        response = self.client.put(str(utils.get_path(href))+"participations/"+self.username+'/',
                                   data={'status':'finish'})
        print "Dycapo Response: \n" + str(response)
        print "#" * 80
        return utils.rest_to_response(response)
