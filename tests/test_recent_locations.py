import classes
import utils
import copy

import response_codes

class TestRecentLocations():
    
    def setup_class(self):
        self.rider = classes.Rider('rider1','password','http://127.0.0.1')
        self.rider.position_lat = 46.494957
        self.rider.position_lon = 11.340239
        self.rider_position = utils.georss_point_from_coords(self.rider.position_lat, self.rider.position_lon)

    def setup_method(self,method):
        self.rider.position = classes.Location(georss_point=self.rider_position)
        
    def test_position(self):
        for i in range (0,10):
            self.rider.position_lon += 0.000030
            self.rider.position = classes.Location(georss_point=utils.georss_point_from_coords(self.rider.position_lat, self.rider.position_lon),leaves=utils.nowplusminutes())
            response = self.rider.update_position(location=self.rider.position)
            assert response['code']==response_codes.POSITIVE