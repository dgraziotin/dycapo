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
"""
This test suite creates a single driver with a selected destination (1.0 1.0)
and a rider searching for a ride in the same destination.
"""

from test_driver import DriverTest
from test_rider import RiderTest
import settings
import os


if __name__=="__main__":
    for i in range(0,1):
        driverthread = DriverTest(settings.DRIVER_USERNAME,settings.DRIVER_PASSWORD,settings.DYCAPO_URL,"46.06693 11.15065",settings.CLEAN_DATABASE_AFTER_TESTS)
        driverthread.client._ServerProxy__verbose = settings.XMLRPC_CLIENT_VERBOSE
        driverthread.start()
    for i in range(0,1):
        riderthread = RiderTest(settings.RIDER_USERNAME,settings.RIDER_PASSWORD,settings.DYCAPO_URL,"46.06693 11.15065")
        riderthread.client._ServerProxy__verbose = settings.XMLRPC_CLIENT_VERBOSE
        riderthread.start()
