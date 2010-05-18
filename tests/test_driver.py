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
import classes
import utils
import copy
import settings
import response_codes

class TestDriver():
    def setup_class(self):
        self.driver = classes.Driver(settings.DRIVER_USERNAME,settings.DRIVER_PASSWORD,settings.DYCAPO_URL)
        self.rider = classes.Rider(settings.RIDER_USERNAME,settings.RIDER_PASSWORD,settings.DYCAPO_URL)
        self.driver_position = '46.490200 11.342294'
        self.driver_destination = '46.500740 11.345073'
        self.rider_position = '46.494957  11.340239'
        self.rider_destination = '46.500891  11.344306'
        
    def teardown_class(self):
        if settings.FINISH_TRIP_AFTER_TESTS:
            self.driver.finish_trip(self.driver.trip)


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