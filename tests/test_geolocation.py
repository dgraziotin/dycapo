import common_classes_and_methods
import random
import time
from test_driver import DriverTest
from test_rider import RiderTest
import settings
delta_lat = 0.00286
delta_lon = 0.00054

original_lat = 46.06693 
original_lon = 11.15065

if __name__=="__main__":
    driver = DriverTest(settings.DRIVER_USERNAME,settings.DRIVER_PASSWORD,settings.DYCAPO_URL,"46.06693 11.15065",settings.CLEAN_DATABASE_AFTER_TESTS)
    driver.client._ServerProxy__verbose = settings.XMLRPC_CLIENT_VERBOSE
    driver.update_position(str(original_lat) + " " + str(original_lon))
    
    rider = RiderTest("luca",settings.RIDER_PASSWORD,settings.DYCAPO_URL,"46.06693 11.15065")
    rider.update_position(str(original_lat) + " " + str(original_lon))
    
    
    rider2 = RiderTest("paola",settings.RIDER_PASSWORD,settings.DYCAPO_URL,"46.06693 11.15065")
    rider2.update_position(str((original_lat + (delta_lat/2))) + " " + str(original_lon))
    
    rider3 = RiderTest("serena",settings.RIDER_PASSWORD,settings.DYCAPO_URL,"46.06693 11.15065")
    rider3.update_position(str(original_lat) + " " + str((original_lon-(delta_lon/2))))
    
    # the two below must not appear in the results.
    rider4 = RiderTest("andrea",settings.RIDER_PASSWORD,settings.DYCAPO_URL,"46.06693 11.15065")
    rider4.update_position(str(original_lat) + " " + str((original_lon-(delta_lon * 3))))
    
    rider5 = RiderTest("rider1",settings.RIDER_PASSWORD,settings.DYCAPO_URL,"46.06693 11.15065")
    rider5.update_position(str(original_lat + (delta_lat*2)) + " " + str((original_lon-(delta_lon * 3))))
    
    driver.persons_near()
    
   