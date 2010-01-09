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

import test_classes
import random
import time
from threading import Thread

class DriverTest(Thread):
    """
    This class represents a Driver using a client. The Driver waits a random value
    of seconds (0 to 20) before inserting the Trip.
    When the object is initialized, a random source and destination are created using
    one value in [1.00,2.00,3.00] (georss_point).
    This test creates a fixed Trip Mode. The trip created is not started, and expires in 3 days.
    After the insertion of the Trip, the Driver waits a random value
    of seconds (0 to 20) before starting the Trip.
    """
    
    client = ''
    clean_results = True
    fixed_destination = None
    
    def __init__(self,username,password,domain,fixed_destination,clean_results):
        Thread.__init__(self)
        self.client = test_classes.get_client(username,password, domain)
        self.clean_results = clean_results
        self.fixed_destination = fixed_destination
        
    def insert_trip(self):
        source = test_classes.Location()
        destination = test_classes.Location()
        mode = test_classes.Mode()
        prefs = test_classes.Prefs()
        trip = test_classes.Trip()
        points = [1.00,2.00,3.00]
        point_lat = random.choice(points)
        point_lon = random.choice(points)
        source.georss_point=str(point_lat) + "," + str(point_lon)
        source.label="home"
        source.point="orig"
        source.leaves = test_classes.now()

        point_lat = random.choice(points)
        point_lon = random.choice(points)
        if self.fixed_destination:
            destination.georss_point = self.fixed_destination
        else:
            destination.georss_point=str(point_lat) + "," + str(point_lon)
        destination.label="office"
        destination.point="dest"
        destination.leaves = test_classes.nowplusminutes(120)
        
        mode.capacity = 3
        mode.vacancy = 3
        mode.color = 'blue'
        mode.cost = 0
        mode.lic = '1234f434'
        mode.make = 'ford'
        mode.model = 'fiesta'
        mode.year = 2003
        mode.kind = 'auto'
        
        prefs.age = '18-40'
        prefs.nonsmoking = False
        
        trip.content = 'description of the trip'
        trip.expires = test_classes.nowplusdays(3)
        print "initializing random Trip from " + source.georss_point + " to " + destination.georss_point
        print "#" * 80
        print "SAVING TRIP..."
        print "#" * 80
        result = self.client.dycapo.add_trip(trip.__dict__,mode.__dict__,prefs.__dict__,source.__dict__,destination.__dict__)
        print result
        print "#" * 80
        return result
    
    def start_trip(self,trip):
        print "#" * 80
        print "STARTING TRIP..."
        print "#" * 80
        result = self.client.dycapo.start_trip(trip)
        print result
        print "#" * 80
        return result
    
    def check_ride_requests(self,trip):
        print "#" * 80
        print "SEARCHING FOR RIDERS..."
        print "#" * 80
        result = self.client.dycapo.check_ride_requests(trip)
        print result
        print "#" * 80
        return result
    
    def accept_ride_request(self,trip,person):
        print "#" * 80
        print "ACCEPTING A RIDE REQUEST..."
        print "#" * 80
        result = self.client.dycapo.accept_ride_request(trip,person)
        print result
        print "#" * 80
        return result
    
    def delete_trip(self,trip):
        print "#" * 80
        print "DELETING TRIP..."
        print "#" * 80
        result = self.client.dycapo.delete_trip(trip)
        print "#" * 80
        return str(result)
    
    def start_test(self):
        test_classes.wait_random_seconds()
        trip = self.insert_trip()
        test_classes.wait_random_seconds()
        trip_result = self.start_trip(trip)
        attempts = 8
        attempts_orig = 8
        found = False
        while not found:
            if attempts==0: 
                print "#" * 80
                print "RIDE REQUEST NOT FOUND IN " +str(attempts_orig)+ " ATTEMPTS. ABORTING"
                print "#" * 80
                break
            test_classes.wait_random_seconds()
            ride_request = self.check_ride_requests(trip)
            if ride_request:
                found = True
                self.accept_ride_request(trip,ride_request)
            attempts = attempts - 1
        if self.clean_results:
            self.delete_trip(trip)
                
    def run(self):
        self.start_test()
        
if __name__ == "__main__": 
    for i in range(0,5):
        driver = DriverTest("driver1","password","127.0.0.1",True)
        driver.start()