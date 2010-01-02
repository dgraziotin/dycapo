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
"""
import test_classes
import random
from threading import Thread
import time
class RiderTest(Thread):
    source = test_classes.Location()
    destination = test_classes.Location()
    client = ''
    
    def __init__(self,username,password,domain):
        Thread.__init__(self)
        self.client = test_classes.get_client(username,password,domain)
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
        print "initializing random ride request from " + self.source.georss_point + " to " + self.destination.georss_point
        
    def search_ride(self):
        print "*" * 80
        print "SEARCHING FOR A RIDE..."
        print "*" * 80
        
        result = self.client.dycapo.search_trip(self.source.__dict__,self.destination.__dict__)
        print result
        print "*" * 80
        return result
    
    def accept_trip(self,trip):
        print "*" * 80
        print "ACCEPTING A RIDE..."
        print "*" * 80
        result = self.client.dycapo.accept_trip(trip)
        if result:
            print trip
        else:
            print "ERROR: you are already participating on this trip!"
        print "*" * 80
        return str(result)
    
    def start_test(self):
        test_classes.wait_random_seconds()
        trip = self.search_ride()
        attempts = 5
        attempts_orig = attempts
        found = False
        while not found:
            if attempts==0: 
                print "*" * 80
                print "RIDE NOT FOUND IN " +str(attempts_orig)+ " ATTEMPTS. ABORTING"
                print "*" * 80
                break
            test_classes.wait_random_seconds()
            trip = self.search_ride()
            attempts = attempts - 1
            if trip: self.accept_trip(trip)
        
    def run(self):
        self.start_test()

if __name__ == "__main__": 
    for i in range(0,5):
        rider = RiderTest("rider1","password","127.0.0.1")
        rider.start()
    