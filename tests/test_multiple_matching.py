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

class TestMultipleMatching():
    def setup_class(self):
        self.driver = classes.Driver(settings.DRIVER_USERNAME,settings.DRIVER_PASSWORD,settings.DYCAPO_URL)

        self.rider1 = classes.Rider("rob",settings.RIDER_PASSWORD,settings.DYCAPO_URL)
        self.rider2 = classes.Rider("dio",settings.RIDER_PASSWORD,settings.DYCAPO_URL)
        self.rider3 = classes.Rider("angela",settings.RIDER_PASSWORD,settings.DYCAPO_URL)
        self.rider4 = classes.Rider("ozzy",settings.RIDER_PASSWORD,settings.DYCAPO_URL)
        self.rider5 = classes.Rider(settings.RIDER_USERNAME,settings.RIDER_PASSWORD,settings.DYCAPO_URL)
        self.riders = [self.rider1, self.rider2, self.rider3, self.rider4]
        self.rider6 = classes.Rider("bruce",settings.RIDER_PASSWORD,settings.DYCAPO_URL)
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
        self.rider5.position = classes.Location(georss_point=self.rider_position)
        self.rider5.destination = classes.Location(georss_point=self.rider_destination,point='dest')
        self.rider6.position = classes.Location(georss_point=self.rider_position)
        self.rider6.destination = classes.Location(georss_point=self.rider_destination,point='dest')

        for rider in self.riders:
            rider.position = classes.Location(georss_point=self.rider_position)
            rider.destination = classes.Location(georss_point=self.rider_destination,point='dest')

    def test_position(self):
        response = self.driver.update_position(location=self.driver.position)
        assert response['code'] == response_codes.POSITIVE
        response = self.driver.get_position()
        assert response['value']['georss_point'] == self.driver.position.georss_point
        self.driver.position = response['value']

        response = self.rider5.update_position(location=self.rider5.position)
        assert response['code'] == response_codes.POSITIVE
        response = self.rider5.get_position()
        assert response['value']['georss_point'] == self.rider5.position.georss_point
        self.rider5.position = response['value']

        response = self.rider6.update_position(location=self.rider6.position)
        assert response['code'] == response_codes.POSITIVE
        response = self.rider6.get_position()
        assert response['value']['georss_point'] == self.rider6.position.georss_point
        self.rider6.position = response['value']

        for rider in self.riders:
            response = rider.update_position(location=rider.position)
            assert response['code'] == response_codes.POSITIVE
            response = rider.get_position()
            assert response['value']['georss_point'] == rider.position.georss_point
            rider.position = response['value']

    """
    def test_insert_trip(self):
        response = self.driver.insert_trip()
        assert response['value']['id'] > 0
        assert [location for location in response['value']['content']['locations'] if location['point']=='dest'][0]['georss_point'] == self.driver_destination
        self.driver.trip = response['value']
    """

    def test_insert_trip_exp(self):
        response = self.driver.insert_trip_exp()
        assert response['value']['id'] > 0
        assert [location for location in response['value']['content']['locations'] if location['point']=='dest'][0]['georss_point'] == self.driver_destination
        assert response['code']==response_codes.POSITIVE
        self.driver.trip = response['value']

    def test_search_trip_before_start(self):
        for rider in self.riders:
            response = rider.search_ride(rider.position,rider.destination)
            assert response['code'] == response_codes.NEGATIVE

    def test_start_trip(self):
        response = self.driver.start_trip()
        assert response['code'] == response_codes.POSITIVE


    def test_search_trip_after_start(self):
        for rider in self.riders:
            response = rider.search_ride(rider.position,rider.destination)
            assert response['code'] == response_codes.POSITIVE
            rider.trip = response['value'][0]

    def test_search_trip_driver_closest_to_destination(self):
        driver_position = '46.500730 11.345070'
        self.driver.position = classes.Location(georss_point=driver_position,point='posi')
        self.driver.update_position()

        response = self.rider1.search_ride(self.rider1.position,self.rider1.destination)
        assert response['code'] == response_codes.NEGATIVE
        self.driver.position = classes.Location(georss_point=self.driver_position)
        self.driver.update_position()

    def test_check_ride_requests_before_request(self):
        response = self.driver.check_ride_requests()
        assert response['code'] == response_codes.NEGATIVE

    def test_get_position_before_request(self):
        for rider in self.riders:
            response = self.driver.get_position(person=rider)
            assert response['code'] == response_codes.NEGATIVE

    def test_request_ride(self):
        for rider in self.riders:
            response = rider.request_ride(trip=rider.trip)
            assert response['code'] == response_codes.POSITIVE

    def test_check_ride_requests_after_request(self):
        for rider in self.riders:
            response = self.driver.check_ride_requests()
            assert response['code'] == response_codes.POSITIVE
            self.driver.ride_request = response['value']

    def test_accept_ride_request(self):
        for rider in self.driver.ride_request:
            response = self.driver.accept_ride_request(rider)
            assert response['code'] == response_codes.POSITIVE

    def test_get_position_after_request(self):
        for rider in self.riders:
            response = self.driver.get_position(person=rider)
            assert response['code'] == response_codes.POSITIVE

    def test_start_ride(self):
        for rider in self.riders:
            if not hasattr(rider,"trip"):
                break
            response = rider.start_ride(rider.trip)
            assert response['code'] == response_codes.POSITIVE

    def test_search_trip_no_vacany(self):
        response = self.rider5.search_ride(self.rider5.position,self.rider5.destination)
        assert response['code'] == response_codes.NEGATIVE

    def test_search_trip_vacany(self):
        response = self.rider4.finish_ride(self.rider4.trip)
        assert response['code'] == response_codes.POSITIVE

        response = self.rider5.search_ride(self.rider5.position,self.rider5.destination)
        assert response['code'] == response_codes.POSITIVE

        self.rider5.trip = response['value'][0]

    def test_request_ride_rider5(self):
        response = self.rider5.request_ride(trip=self.rider5.trip)
        assert response['code'] == response_codes.POSITIVE

    def test_check_ride_request_rider5(self):
        response = self.driver.check_ride_requests()
        assert response['code'] == response_codes.POSITIVE
        assert response['value'][0]['username'] == self.rider5.username
        self.driver.ride_request = response['value']

    def test_cancel_requested_ride(self):
        response = self.rider5.cancel_requested_ride(trip=self.rider5.trip)
        assert response['code'] == response_codes.POSITIVE

    def test_check_cancelled_ride_request_rider5(self):
        response = self.driver.check_ride_requests()
        assert response['code'] == response_codes.NEGATIVE

    def test_get_position_cancelled_ride_request(self):
        response = self.driver.get_position(self.rider5)
        assert response['code'] == response_codes.NEGATIVE


    def test_search_trip_rider6(self):
        response = self.rider6.search_ride(self.rider6.position,self.rider6.destination)
        assert response['code'] == response_codes.POSITIVE
        self.rider6.trip = response['value'][0]

    def test_request_ride_rider6(self):
        response = self.rider6.request_ride(trip=self.rider6.trip)
        assert response['code'] == response_codes.POSITIVE

    def test_check_ride_request_rider6(self):
        response = self.driver.check_ride_requests()
        assert response['code'] == response_codes.POSITIVE
        assert response['value'][0]['username'] == self.rider6.username
        self.driver.ride_request = response['value']

    def test_finish_ride(self):
        for rider in self.riders:
            if not hasattr(rider,"trip"):
                break
            response = rider.finish_ride(rider.trip)
            assert response['code'] == response_codes.POSITIVE

    def test_get_position_after_ride_finished(self):
        for rider in self.riders:
            response = self.driver.get_position(person=rider)
            assert response['code'] == response_codes.NEGATIVE
