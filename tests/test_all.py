from test_driver import DriverTest
from test_rider import RiderTest

for i in range(0,5):
    driver = DriverTest("driver1","password")
    driver.start()
    
for i in range(0,5):
    rider = RiderTest("rider1","password")
    rider.start()
    