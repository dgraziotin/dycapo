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
This test suite creates a single driver with a selected destination (1.0,1.0)
and a rider searching for a ride in the same destination.
"""
from test_driver import DriverTest
from test_rider import RiderTest
import os

    
if __name__=="__main__":
   
    riderthread = RiderTest("rider1","password","127.0.0.1","1.0,1.0")
    riderthread.get_user()
    '''
    for i in range(0,1):
        driverthread = DriverTest("driver1","password","127.0.0.1","1.0,1.0",False)
        driverthread.start()
    for i in range(0,1):
        riderthread = RiderTest("rider1","password","127.0.0.1","1.0,1.0")
        riderthread.client._ServerProxy__verbose = 0
        riderthread.start()
    '''