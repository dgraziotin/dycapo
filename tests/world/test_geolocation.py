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
    '''
    driver = DriverTest(settings.DRIVER_USERNAME,settings.DRIVER_PASSWORD,settings.DYCAPO_URL,"46.06693 11.15065",settings.CLEAN_DATABASE_AFTER_TESTS)
    driver.client._ServerProxy__verbose = settings.XMLRPC_CLIENT_VERBOSE
    driver.update_position(str(original_lat) + " " + str(original_lon))
    '''
    rider = RiderTest("luca",settings.RIDER_PASSWORD,settings.DYCAPO_URL,"46.06693 11.15065")
    #rider.client._ServerProxy__verbose = True
    rider.search_ride()
    
    
   