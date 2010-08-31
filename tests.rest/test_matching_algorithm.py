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

class TestMatchingAlgorithm():
    def setup_class(self):
        self.driver = classes.Driver(settings.DRIVER_USERNAME,settings.DRIVER_PASSWORD,settings.DYCAPO_URL)
        self.rider = classes.Rider(settings.RIDER_USERNAME,settings.RIDER_PASSWORD,settings.DYCAPO_URL)

        self.driver_position    = '46.500000  11.340000'
        # rider is +0.002000 North
        self.rider_position     = '46.502000  11.340000'
        # driver will move to +0.005000 North
        self.driver_destination = '46.505000  11.340000'
        # rider will move to +0.002000 North
        self.rider_destination  = '46.504000  11.340000'

        self.driver.position_lat    = 46.500000
        self.rider.position_lat     = 46.502000
        self.driver.position_lon    = 11.340000
        self.rider.position_lon     = 11.340000

    def teardown_class(self):
        if settings.FINISH_TRIP_AFTER_TESTS:
            self.driver.finish_trip(self.driver.trip)

    def setup_method(self,method):
        self.driver.location = classes.Location(georss_point=self.driver_position)
        self.driver.destination = classes.Location(georss_point=self.driver_destination,point='dest')
        self.rider.location = classes.Location(georss_point=self.rider_position)
        self.rider.destination = classes.Location(georss_point=self.rider_destination,point='dest')

    def test_position(self):
        response = self.driver.update_position(location=self.driver.location)
        assert response['code'] == response_codes.CREATED
        response = self.driver.get_position()
        assert response['value']['georss_point'] == self.driver.location.georss_point
        self.driver.location = response['value']
        response = self.rider.update_position(location=self.rider.location)
        assert response['code'] == response_codes.CREATED
        response = self.rider.get_position()
        assert response['value']['georss_point'] == self.rider.location.georss_point
        self.rider.location = response['value']

    def test_insert_trip_exp(self):
        response = self.driver.insert_trip_exp()
        assert response['value']['id'] > 0
        assert [location for location in response['value']['locations'] if location['point']=='dest'][0]['georss_point'] == self.driver_destination
        assert response['code']==response_codes.ALL_OK
        self.driver.trip = response['value']

    def test_start_trip(self):
        response = self.driver.start_trip()
        assert response['code'] == response_codes.ALL_OK

    def test_search_trip_base(self):
        response = self.rider.search_ride(self.rider.location,self.rider.destination)
        assert response['code'] == response_codes.ALL_OK
        self.rider.trip = response['value']['trips'][0]

    def test_search_trip_valid(self):
        '''
        We move Driver + 0.00010 North 20 times, until he reaches rider
        location. Rider is +0.002000 North initially.
        Before this method:
            Driver Position:    '46.500000  11.340000'
            Rider Position:     '46.502000  11.340000'
        After this method:
            Driver Position:    '46.502000  11.340000'
            Rider Position:     '46.502000  11.340000'
        '''
        for i in range (1,21):
            self.driver.position_lat += 0.000100
            self.driver_position = utils.georss_point_from_coords(self.driver.position_lat,self.driver.position_lon)
            self.driver.location = classes.Location(georss_point=self.driver_position)
            response = self.driver.update_position(location=self.driver.location)
            assert response['code'] == response_codes.CREATED
            response = self.rider.search_ride(self.rider.location,self.rider.destination)
            assert response['code'] == response_codes.ALL_OK
            self.rider.trip = response['value']['trips'][0]

        driver_position = utils.coords_from_georss_point(self.driver.get_position()['value']['georss_point'])
        rider_position = utils.coords_from_georss_point(self.rider.get_position()['value']['georss_point'])
        assert driver_position == rider_position


    def test_search_trip_driver_closer_to_destination(self):
        '''
        Rider and driver are now at the same latitude, 46.502000. We move Driver to
        46.503000 North (+0.01000). Therefore, driver is after rider and closer to
        the destination.
        Before this method:
            Driver Position:    '46.502000  11.340000'
            Rider Position:     '46.502000  11.340000'
        After this method:
            Driver Position:    '46.503000  11.340000'
            Rider Position:     '46.502000  11.340000'
        '''
        self.driver.position_lat += 0.001000
        self.driver_position = utils.georss_point_from_coords(self.driver.position_lat,self.driver.position_lon)
        self.driver.location = classes.Location(georss_point=self.driver_position)
        response = self.driver.update_position(location=self.driver.location)
        assert response['code'] == response_codes.CREATED
        response = self.rider.search_ride(self.rider.location,self.rider.destination)
        assert response['code'] == response_codes.NOT_FOUND

    def test_search_trip_driver_moving_away_from_rider(self):
        '''
        We now move the Driver to South, making it moving away from rider.
        Therefore, rider should not get his trip in a search.
        Before this method:
            Driver Position:    '46.503000  11.340000'
            Rider Position:     '46.502000  11.340000'
        After this method:
            Driver Position:    '46.501000  11.340000'
            Rider Position:     '46.502000  11.340000'
        '''
        for i in range (1,21):
            self.driver.position_lat -= 0.0001
            self.driver_position = utils.georss_point_from_coords(self.driver.position_lat,self.driver.position_lon)
            self.driver.location = classes.Location(georss_point=self.driver_position)
            response = self.driver.update_position(location=self.driver.location)
            assert response['code'] == response_codes.CREATED
        driver_position = utils.coords_from_georss_point(self.driver.get_position()['value']['georss_point'])

        response = self.rider.search_ride(self.rider.location,self.rider.destination)
        assert response['code'] == response_codes.NOT_FOUND
