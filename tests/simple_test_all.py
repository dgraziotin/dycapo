from test_driver import DriverTest
from test_rider import RiderTest
import os

    
if __name__=="__main__":
    for i in range(0,1):
        driverthread = DriverTest("driver1","password","127.0.0.1","1.0,1.0",False)
        driverthread.start()
    for i in range(0,1):
        riderthread = RiderTest("rider1","password","127.0.0.1","1.0,1.0")
        riderthread.client._ServerProxy__verbose = 0
        riderthread.start()