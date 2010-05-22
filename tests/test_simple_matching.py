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

class TestSimpleMatching():
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
    """
    def test_search_trip_before_start(self):
        response = self.rider.search_ride(self.rider.position,self.rider.destination)
        assert response['code'] == response_codes.NEGATIVE
    """
    def test_start_trip(self):
        response = self.driver.start_trip()
        assert response['code'] == response_codes.POSITIVE

    def test_search_trip_after_start(self):
        response = self.rider.search_ride(self.rider.position,self.rider.destination)
        assert response['code'] == response_codes.POSITIVE
        self.rider.trip = response['value'][0]

    def test_search_trip_driver_closest_to_destination(self):
        driver_position = '46.500730 11.345070'
        self.driver.position = classes.Location(georss_point=driver_position,point='posi')
        self.driver.update_position()

        response = self.rider.search_ride(self.rider.position,self.rider.destination)
        assert response['code'] == response_codes.NEGATIVE
        self.driver.position = classes.Location(georss_point=self.driver_position)
        self.driver.update_position()

    def test_check_ride_requests_before_request(self):
        response = self.driver.check_ride_requests()
        assert response['code'] == response_codes.NEGATIVE

    def test_request_ride(self):
        response = self.rider.request_ride(trip=self.rider.trip)
        assert response['code'] == response_codes.POSITIVE

    def test_check_ride_requests_after_request(self):
        response = self.driver.check_ride_requests()
        assert response['code'] == response_codes.POSITIVE
        self.driver.ride_request = response['value']

    def test_accept_ride_request(self):
        response = self.driver.accept_ride_request(self.driver.ride_request[0])
        assert response['code'] == response_codes.POSITIVE

    def test_start_ride(self):
        if not hasattr(self.rider,"trip"):
            return
        response = self.rider.start_ride(self.rider.trip)
        assert response['code'] == response_codes.POSITIVE

    def test_finish_ride(self):
        if not hasattr(self.rider,"trip"):
            return
        response = self.rider.finish_ride(self.rider.trip)
        assert response['code'] == response_codes.POSITIVE
