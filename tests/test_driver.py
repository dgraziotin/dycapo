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
    source = test_classes.Location()
    destination = test_classes.Location()
    client = ''
    mode = test_classes.Mode()
    trip = test_classes.Trip()
    
    def __init__(self,username,password,domain):
        Thread.__init__(self)
        self.client = test_classes.get_client(username,password, domain)
        points = [1.00,2.00,3.00]
        point_lat = random.choice(points)
        point_lon = random.choice(points)
        self.source.georss_point=str(point_lat) + "," + str(point_lon)
        self.source.label="home"
        self.source.point="orig"
        self.source.leaves = test_classes.now()

        point_lat = random.choice(points)
        point_lon = random.choice(points)
        self.destination.georss_point=str(point_lat) + "," + str(point_lon)
        self.destination.label="office"
        self.destination.point="dest"
        self.destination.leaves = test_classes.nowplusminutes(120)
        
        self.mode.capacity = 3
        self.mode.vacancy = 3
        self.mode.color = 'blue'
        self.mode.cost = 0
        self.mode.lic = '1234f434'
        self.mode.make = 'ford'
        self.mode.model = 'fiesta'
        self.mode.year = 2003
        self.mode.kind = 'auto'
        
        self.trip.content = 'description of the trip'
        self.trip.expires = test_classes.nowplusdays(3)
        print "initializing random Trip from " + self.source.georss_point + " to " + self.destination.georss_point
        
    def insert_trip(self):
        print "#" * 80
        print "SAVING TRIP..."
        print "#" * 80
        result = self.client.dycapo.add_trip(self.trip.__dict__,self.mode.__dict__,self.source.__dict__,self.destination.__dict__)
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
    
    def start_test(self):
        test_classes.wait_random_seconds()
        trip = self.insert_trip()
        test_classes.wait_random_seconds()
        trip = self.start_trip(trip)
    
    def run(self):
        self.start_test()
        
if __name__ == "__main__": 
    for i in range(0,5):
        driver = DriverTest("driver1","password","127.0.0.1")
        driver.start()
