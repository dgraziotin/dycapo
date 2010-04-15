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
This class represents a Rider using a client.
The rider waits a random value of seconds (0 to 20) before searching a Ride.
A random source and destination are created using one value in [1.00,2.00,3.00] (georss_point).
The rider then searches for a Ride. If a Ride is available, it accepts it. If the Ride is
not available, it waits a random value of seconds (0 to 20) and then searches again.
The Rider aborts after 5 attempts.
If the object is instantiated with fixed_destination!=None, then it must be a georss_point, like
"1.0,3.0"
"""
import common_classes_and_methods
import random
from threading import Thread
import time
import settings 
class RiderTest(Thread):
    client = ''
    fixed_destination = None
    username = ""
    position = ''
    
    def __init__(self,username,password,domain,fixed_destination):
        Thread.__init__(self)
        self.client = common_classes_and_methods.get_client(username,password,domain)
        self.fixed_destination = fixed_destination
        self.username = username
        self.position = common_classes_and_methods.Location()
        self.position.georss_point="33.3 66.6"
        self.position.leaves = common_classes_and_methods.now()
    
    def search_ride(self):
        source = common_classes_and_methods.Location()
        destination = common_classes_and_methods.Location()
        points = [1.00,2.00,3.00]
        point_lat = random.choice(points)
        point_lon = random.choice(points)
        source.georss_point=str(point_lat) + " " + str(point_lon)
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
        print "*" * 80
        print self.username + ": SEARCHING FOR A RIDE from " + source.georss_point + " to " + destination.georss_point
        print "*" * 80
        
        response = self.client.dycapo.search_trip(source.__dict__,destination.__dict__)
        print "Dycapo Response: \n" + str(response)
        print "*" * 80
        return common_classes_and_methods.extract_response(response)
    
    def request_ride(self,trip):
        print "*" * 80
        print self.username + ": REQUESTING A RIDE..."
        print "*" * 80
        response = self.client.dycapo.request_ride(trip)
        if response:
            print "Dycapo Response: \n" + str(response)
        else:
            print self.username + ": ERROR: you are already participating on this trip!"
        print "*" * 80
        return common_classes_and_methods.extract_response(response)
    
     
    def update_position(self):
        print "#" * 80
        print self.username + ": UPDATING POSITION..."
        print "#" * 80
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
    
    def start_test(self):
        common_classes_and_methods.wait_random_seconds()
        trip = self.search_ride()
        attempts = 5
        attempts_orig = attempts
        found = False
        self.update_position()
        while not found:
            if attempts==0: 
                print "*" * 80
                print self.username + ": RIDE NOT FOUND IN " +str(attempts_orig)+ " ATTEMPTS. ABORTING"
                print "*" * 80
                break
            common_classes_and_methods.wait_random_seconds()
            self.update_position()
            trip = self.search_ride()
            attempts = attempts - 1
            if trip: 
                self.request_ride(trip)
                found=True
    
    def get_user(self):
        response = self.client.dycapo.get_user()
        print response
        
    def run(self):
        self.start_test()

if __name__ == "__main__": 
    for i in range(0,1):
        rider = RiderTest(settings.RIDER_USERNAME,settings.RIDER_PASSWORD,settings.DYCAPO_URL,"46.06693 11.15065")
        rider.start()
    