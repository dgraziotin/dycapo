import classes
import utils
import copy

import response_codes

class TestDriver():
    def setup_class(self):
        self.driver = classes.Driver('driver1','password','http://127.0.0.1')
        self.rider = classes.Rider('rider1','password','http://127.0.0.1')
        self.driver_position = '46.490200 11.342294'
        self.driver_destination = '46.500740 11.345073'
        self.rider_position = '46.494957  11.340239'
        self.rider_destination = '46.500891  11.344306'
        
    def teardown_class(self):
        self.driver.delete_trip(self.driver.trip)


    def setup_method(self,method):
        self.driver.position = classes.Location(georss_point=self.driver_position)
        self.driver.destination = classes.Location(georss_point=self.driver_destination,point='dest')
        self.rider.position = classes.Location(georss_point=self.rider_position)
        self.rider.destination = classes.Location(georss_point=self.rider_destination,point='dest')
        
    def test_position(self):
        old_position = self.driver.position
        new_position = classes.Location(georss_point='46.000 11.000')
        self.driver.update_position(location=new_position)
        response = self.driver.get_position()
        assert response['value']['georss_point'] != old_position.georss_point
        assert response['value']['georss_point'] == new_position.georss_point
        self.driver.update_position(location=old_position)
        response = self.driver.get_position()
        assert response['value']['georss_point'] == old_position.georss_point
        assert response['value']['georss_point'] != new_position.georss_point
   
    def test_insert_trip(self):
        response = self.driver.insert_trip()
        assert response['value']['id'] > 0
        assert [location for location in response['value']['content']['locations'] if location['point']=='dest'][0]['georss_point'] == self.driver_destination
        self.driver.trip = response['value']
        
    def test_start_trip(self):
        response = self.driver.start_trip()
        assert response['code'] == response_codes.POSITIVE
    
    def test_check_ride_requests(self):
        response = self.driver.check_ride_requests()
        assert response['code'] == response_codes.NEGATIVE
        
    def test_accept_ride_request(self):
        response = self.driver.accept_ride_request({'username':'rider1'})
        assert response['code'] == response_codes.ERROR
    
