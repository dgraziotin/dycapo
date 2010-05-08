import classes
import utils
import copy

import response_codes

class TestMatchingAlgorithm():
    def setup_class(self):
        self.driver = classes.Driver('driver1','password','http://127.0.0.1')
        self.rider = classes.Rider('rider1','password','http://127.0.0.1')
        self.driver_position = '46.490200 11.342294'
        self.driver_destination = '46.500740 11.345073'
        self.rider_position = '46.494957  11.340239'
        self.rider_destination = '46.500891  11.344306'
        self.rider.position_lat = 46.494957
        self.rider.position_lon = 11.340239
        self.driver.position_lat = 46.490200
        self.driver.position_lon = 11.342294
        
    def teardown_class(self):
        self.driver.delete_trip(self.driver.trip)

    def setup_method(self,method):
        self.driver.position = classes.Location(georss_point=self.driver_position)
        self.driver.destination = classes.Location(georss_point=self.driver_destination,point='dest')
        self.rider.position = classes.Location(georss_point=self.rider_position)
        self.rider.destination = classes.Location(georss_point=self.rider_destination,point='dest')
        
    def test_position(self):
        response = self.driver.update_position(location=self.driver.position)
        assert response['code'] == response_codes.POSITIVE
        response = self.driver.get_position()
        assert response['value']['georss_point'] == self.driver.position.georss_point
        self.driver.position = response['value']
        response = self.rider.update_position(location=self.rider.position)
        assert response['code'] == response_codes.POSITIVE
        response = self.rider.get_position()
        assert response['value']['georss_point'] == self.rider.position.georss_point
        self.rider.position = response['value']
        
    
    def test_insert_trip(self):
        response = self.driver.insert_trip()
        assert response['value']['id'] > 0
        assert [location for location in response['value']['content']['locations'] if location['point']=='dest'][0]['georss_point'] == self.driver_destination
        self.driver.trip = response['value']
        
    def test_start_trip(self):
        response = self.driver.start_trip()
        assert response['code'] == response_codes.POSITIVE
    
    def test_search_trip_driver_closest_to_destination(self):
        driver_position = '46.50060 11.345050'
        self.driver.position = classes.Location(georss_point=driver_position)
        self.driver.update_position()
        
        response = self.rider.search_ride(self.rider.position,self.rider.destination)
        assert response['code'] == response_codes.NEGATIVE
        self.driver.position = classes.Location(georss_point=self.driver_position)
        self.driver.update_position()
    
    def test_search_trip(self):
        response = self.rider.search_ride(self.rider.position,self.rider.destination)
        assert response['code'] == response_codes.POSITIVE
        self.rider.trip = response['value'][0]
    
    def test_search_trip_valid_1(self):
        self.driver.position_lat += 0.000030
        self.driver.position = classes.Location(georss_point=utils.georss_point_from_coords(self.driver.position_lat, self.driver.position_lon),leaves=utils.nowplusminutes(1))
        response = self.driver.update_position(location=self.driver.position)
        response = self.rider.search_ride(self.rider.position,self.rider.destination)
        assert response['code'] == response_codes.POSITIVE
        self.rider.trip = response['value'][0]
    
    def test_search_trip_valid_2(self):
        self.driver.position_lat += 0.000030
        self.driver.position = classes.Location(georss_point=utils.georss_point_from_coords(self.driver.position_lat, self.driver.position_lon),leaves=utils.nowplusminutes(2))
        response = self.driver.update_position(location=self.driver.position)
        response = self.rider.search_ride(self.rider.position,self.rider.destination)
        assert response['code'] == response_codes.POSITIVE
        self.rider.trip = response['value'][0]
        
    def test_search_trip_valid_3(self):
        self.driver.position_lat += 0.000030
        self.driver.position = classes.Location(georss_point=utils.georss_point_from_coords(self.driver.position_lat, self.driver.position_lon),leaves=utils.nowplusminutes(3))
        response = self.driver.update_position(location=self.driver.position)
        response = self.rider.search_ride(self.rider.position,self.rider.destination)
        assert response['code'] == response_codes.POSITIVE
        self.rider.trip = response['value'][0]
    
    def test_search_trip_not_valid_1(self):
        self.driver.position_lon = self.rider.position_lon
        self.driver.position_lat = self.rider.position_lat + 0.000030
        self.driver.position = classes.Location(georss_point=utils.georss_point_from_coords(self.driver.position_lat, self.driver.position_lon),leaves=utils.nowplusminutes(4))
        response = self.driver.update_position(location=self.driver.position)
        
        response = self.rider.search_ride(self.rider.position,self.rider.destination)
        assert response['code'] == response_codes.NEGATIVE
        
    def test_search_trip_not_valid_2(self):
        self.driver.position_lon = self.rider.position_lon + 0.000030
        self.driver.position_lat = self.rider.position_lat
        self.driver.position = classes.Location(georss_point=utils.georss_point_from_coords(self.driver.position_lat, self.driver.position_lon),leaves=utils.nowplusminutes(5))
        response = self.driver.update_position(location=self.driver.position)
        
        response = self.rider.search_ride(self.rider.position,self.rider.destination)
        assert response['code'] == response_codes.NEGATIVE
        
    def test_search_trip_not_valid_3(self):
        latitude = 46.494957
        longitude = 11.340239
        self.driver.position = classes.Location(georss_point=utils.georss_point_from_coords(latitude,longitude),leaves=utils.nowplusminutes(0))
        response = self.driver.update_position(location=self.driver.position)
        for i in range (0,10):
            latitude -= 0.000500
            self.driver.position = classes.Location(georss_point=utils.georss_point_from_coords(latitude,longitude),leaves=utils.nowplusminutes(0))
            response = self.driver.update_position(location=self.driver.position)
            
        response = self.rider.search_ride(self.rider.position,self.rider.destination)
        assert response['code'] == response_codes.NEGATIVE
        
    
        