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
This test suite creates three driver inserting a random trip, and 5 riders
requesting rides in random locations.
"""
from test_driver import DriverTest
from test_rider import RiderTest
import os, sys

for i in range(0,3): # number of driver threads inserting and starting trips
    driver = DriverTest("driver1","password","127.0.0.1",None,False)
    driver.start()
 
for i in range(0,5): # number of rider threads searching and accepting trips
    rider = RiderTest("rider1","password","127.0.0.1",None)
    rider.client._ServerProxy__verbose = 0
    rider.start()
    