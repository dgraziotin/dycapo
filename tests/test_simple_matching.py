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
import classes
import utils
import copy
import settings
import response_codes

class TestSimpleMatching():
    def setup_class(self):
        self.driver = classes.Driver(settings.DRIVER_USERNAME,settings.DRIVER_PASSWORD,settings.DYCAPO_URL)
        self.rider = classes.Rider(settings.RIDER_USERNAME,settings.RIDER_PASSWORD,settings.DYCAPO_URL)
        self.rider2 = classes.Rider("ozzy",settings.RIDER_PASSWORD,settings.DYCAPO_URL)
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
        self.rider2.position = classes.Location(georss_point=self.rider_position)
        self.rider2.destination = classes.Location(georss_point=self.rider_destination,point='dest')

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
        response = self.rider2.update_position(location=self.rider2.position)
        assert response['code'] == response_codes.POSITIVE
        response = self.rider2.get_position()
        assert response['value']['georss_point'] == self.rider2.position.georss_point
        self.rider2.position = response['value']


    """
    def test_insert_trip(self):
        response = self.driver.insert_trip()
        assert response['value']['id'] > 0
        assert [location for location in response['value']['content']['locations'] if location['point']=='dest'][0]['georss_point'] == self.driver_destination
        self.driver.trip = response['value']

    def test_search_trip_before_start(self):
        response = self.rider.search_ride(self.rider.position,self.rider.destination)
        assert response['code'] == response_codes.NEGATIVE
    """
    def test_insert_trip_exp(self):
        response = self.driver.insert_trip_exp()
        assert response['value']['id'] > 0
        assert [location for location in response['value']['content']['locations'] if location['point']=='dest'][0]['georss_point'] == self.driver_destination
        assert response['code']==response_codes.POSITIVE
        self.driver.trip = response['value']

    def test_start_trip(self):
        response = self.driver.start_trip()
        assert response['code'] == response_codes.POSITIVE

    def test_search_trip_after_start(self):
        response = self.rider.search_ride(self.rider.position,self.rider.destination)
        assert response['code'] == response_codes.POSITIVE
        self.rider.trip = response['value'][0]
        response = self.rider2.search_ride(self.rider2.position,self.rider2.destination)
        assert response['code'] == response_codes.POSITIVE
        self.rider2.trip = response['value'][0]

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
        response = self.rider2.request_ride(trip=self.rider2.trip)
        assert response['code'] == response_codes.POSITIVE

    def test_check_requested_ride(self):
        response = self.rider.check_requested_ride(trip=self.rider.trip)
        assert response['code'] == response_codes.NEGATIVE
        response = self.rider2.check_requested_ride(trip=self.rider2.trip)
        assert response['code'] == response_codes.NEGATIVE

    def test_check_ride_requests_after_request(self):
        response = self.driver.check_ride_requests()
        assert response['code'] == response_codes.POSITIVE
        self.driver.ride_request = response['value']
        assert len(self.driver.ride_request) == 2

    def test_accept_ride_request(self):
        response = self.driver.accept_ride_request(self.driver.ride_request[0])
        assert response['code'] == response_codes.POSITIVE

    def test_refuse_ride_request(self):
        response = self.driver.refuse_ride_request(self.driver.ride_request[1])
        assert response['code'] == response_codes.POSITIVE

    def test_check_requested_ride_after_ride_accepted(self):
        response = self.rider.check_requested_ride(trip=self.rider.trip)
        assert response['code'] == response_codes.POSITIVE
        response = self.rider2.check_requested_ride(trip=self.rider2.trip)
        assert response['code'] == response_codes.NEGATIVE

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
