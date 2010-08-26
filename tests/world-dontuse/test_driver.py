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

import common_classes_and_methods
import random
import time
from threading import Thread
import settings

class DriverTest(Thread):
    """
    This class represents a Driver using a client. The Driver waits a random value
    of seconds (0 to 20) before inserting the Trip.
    When the object is initialized, a random source and destination are created using
    one value in [1.00,2.00,3.00] (georss_point).
    This test creates a fixed Trip Modality. The trip created is not started, and expires in 3 days.
    After the insertion of the Trip, the Driver waits a random value
    of seconds (0 to 20) before starting the Trip.
    If the object is instantiated with clean_responses = True, then the Trip is deleted at the end of
    the test.
    If the object is instantiated with fixed_destination!=None, then it must be a georss_point, like
    "1.0,3.0"
    """

    client = ''
    clean_responses = True
    fixed_destination = None
    username = ''
    position = ''

    def __init__(self,username,password,domain,fixed_destination,clean_responses):
        Thread.__init__(self)
        self.client = common_classes_and_methods.get_client(username,password, domain)
        self.clean_responses = clean_responses
        self.fixed_destination = fixed_destination
        self.username = username
        self.position = common_classes_and_methods.Location()
        self.position.georss_point='45.96304996635425, 11.106381118297577'#"46.462822799999998, 11.3343092"
        self.position.leaves = common_classes_and_methods.now()

    def insert_trip(self):
        source = common_classes_and_methods.Location()
        destination = common_classes_and_methods.Location()
        modality = common_classes_and_methods.Modality()
        preferences = common_classes_and_methods.Preferences()
        trip = common_classes_and_methods.Trip()
        points = [1.00,2.00,3.00]
        point_lat = random.choice(points)
        point_lon = random.choice(points)
        source.georss_point="46.462822799999998, 11.3343092"
        source.label="home"
        source.point="orig"
        source.leaves = common_classes_and_methods.now()

        point_lat = random.choice(points)
        point_lon = random.choice(points)
        if self.fixed_destination:
            destination.georss_point = self.fixed_destination
        else:
            destination.georss_point=str(point_lat) + "," + str(point_lon)
        destination.label="office"
        destination.point="dest"
        destination.leaves = common_classes_and_methods.nowplusminutes(120)

        modality.capacity = 3
        modality.vacancy = 3
        modality.color = 'blue'
        modality.cost = 0
        modality.lic = '1234f434'
        modality.make = 'ford'
        modality.model = 'fiesta'
        #modality.year = 2003
        modality.kind = 'auto'

        preferences.age = '18-40'
        preferences.nonsmoking = False

        trip.content = 'description of the trip'
        trip.expires = common_classes_and_methods.nowplusdays(3)
        print "initializing random Trip from " + source.georss_point + " to " + destination.georss_point
        print "#" * 80
        print self.username + ": SAVING TRIP..."
        print "#" * 80
        response = self.client.dycapo.add_trip(trip.__dict__,modality.__dict__,preferences.__dict__,source.__dict__,destination.__dict__)
        print "Dycapo Response: \n" + str(response)
        print "#" * 80
        return common_classes_and_methods.extract_response(response)

    def start_trip(self,trip):
        print "#" * 80
        print self.username + ": STARTING TRIP..."
        print "#" * 80
        response = self.client.dycapo.start_trip(trip)
        print response
        print "#" * 80
        return common_classes_and_methods.extract_response(response)

    def check_ride_requests(self,trip):
        print "#" * 80
        print self.username + ": SEARCHING FOR RIDERS..."
        print "#" * 80
        response = self.client.dycapo.check_ride_requests(trip)
        print "Dycapo Response: \n" + str(response)
        print "#" * 80
        return common_classes_and_methods.extract_response(response)

    def accept_ride_request(self,trip,person):
        print "#" * 80
        print self.username + ": ACCEPTING A RIDE REQUEST..."
        print "#" * 80
        response = self.client.dycapo.accept_ride_request(trip,person)
        print "Dycapo Response: \n" + str(response)
        print "#" * 80
        return common_classes_and_methods.extract_response(response)

    def update_position(self):
        print "#" * 80
        print self.username + ": UPDATING POSITION..."
        print "#" * 80
        response = self.client.dycapo.update_position(self.position)
        print "Dycapo Response: \n" + str(response)
        print "#" * 80
        return common_classes_and_methods.extract_response(response)

    def update_position(self,georss_point=None):
        print "#" * 80
        print self.username + ": UPDATING POSITION..."
        print "#" * 80
        if georss_point:
            self.position.georss_point = georss_point
            self.position.street = ''
            self.position.postcode = ''
            self.position.point = 'posi'
        response = self.client.dycapo.update_position(self.position)
        print "Dycapo Response: \n" + str(response)
        print "#" * 80
        return common_classes_and_methods.extract_response(response)

    def get_position(self):
        print "#" * 80
        print self.username + ": GETTING POSITION..."
        print "#" * 80
        person = common_classes_and_methods.Person()
        person.username = self.username
        response = self.client.dycapo.get_position(person)
        print "Dycapo Response: \n" + str(response)
        print "#" * 80
        return common_classes_and_methods.extract_response(response)

    def persons_near(self):
        print "#" * 80
        print self.username + ": PERSONS NEAR..."
        print "#" * 80
        response = self.client.dycapo.persons_near()
        print "Dycapo Response: \n" + str(response)
        print "#" * 80
        return common_classes_and_methods.extract_response(response)

    def delete_trip(self,trip):
        print "#" * 80
        print "DELETING TRIP..."
        print "#" * 80
        response = self.client.dycapo.delete_trip(trip)
        print "#" * 80
        return common_classes_and_methods.extract_response(response)

    def start_test(self):
        common_classes_and_methods.wait_random_seconds()
        self.update_position()
        trip = self.insert_trip()
        common_classes_and_methods.wait_random_seconds()
        trip_response = self.start_trip(trip)
        """
        attempts = 8
        attempts_orig = 8
        found = False
        while not found:

            self.update_position()

            self.get_position()

            if attempts==0:
                print "#" * 80
                print "RIDE REQUEST NOT FOUND IN " +str(attempts_orig)+ " ATTEMPTS. ABORTING"
                print "#" * 80
                break
            common_classes_and_methods.wait_random_seconds()
            self.update_position()
            self.get_position()
            ride_request = self.check_ride_requests(trip)
            if ride_request:
                found = True
                self.accept_ride_request(trip,ride_request)
            attempts = attempts - 1
        if self.clean_responses:
            self.delete_trip(trip)
        """

    def run(self):
        self.start_test()

if __name__ == "__main__":
    for i in range(0,1):
        driverthread = DriverTest(settings.DRIVER_USERNAME,settings.DRIVER_PASSWORD,settings.DYCAPO_URL,"46.06693 11.15065",settings.CLEAN_DATABASE_AFTER_TESTS)
        driverthread.client._ServerProxy__verbose = settings.XMLRPC_CLIENT_VERBOSE
        driverthread.start()
