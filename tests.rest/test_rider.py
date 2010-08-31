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

class TestRider():
    def setup_class(self):
        self.driver = classes.Driver(settings.DRIVER_USERNAME,settings.DRIVER_PASSWORD,settings.DYCAPO_URL)
        self.rider = classes.Rider(settings.RIDER_USERNAME,settings.RIDER_PASSWORD,settings.DYCAPO_URL)
        self.driver_position = '46.490200 11.342294'
        self.driver_destination = '46.500740 11.345073'
        self.rider_position = '46.494957  11.340239'
        self.rider_destination = '46.500891  11.344306'


    def setup_method(self,method):
        self.driver.location = classes.Location(georss_point=self.driver_position)
        self.driver.destination = classes.Location(georss_point=self.driver_destination,point='dest')
        self.rider.location = classes.Location(georss_point=self.rider_position)
        self.rider.destination = classes.Location(georss_point=self.rider_destination,point='dest')

    def test_position(self):
        old_position = self.rider.location
        new_position = classes.Location(georss_point='46.000 11.000')
        self.rider.update_position(location=new_position)
        response = self.rider.get_position()
        assert response['value']['georss_point'] != old_position.georss_point
        assert response['value']['georss_point'] == new_position.georss_point
        self.rider.update_position(location=old_position)
        response = self.rider.get_position()
        assert response['value']['georss_point'] == old_position.georss_point
        assert response['value']['georss_point'] != new_position.georss_point

    def test_search_trip(self):
        response = self.rider.search_ride(self.rider.location,self.rider.destination)
        assert response['code'] == response_codes.NOT_FOUND

    def test_request_ride(self,trip=None):
        if not trip:
            if not hasattr(self,"trip"):
                self.trip = classes.Trip()
            trip = self.trip
            trip.author = ""
            trip.modality = ""
            trip.preferences = ""
            trip.modality = ""
            trip.locations = []
            trip.href = ""
        response = self.rider.request_ride(trip)
        assert response['code'] == response_codes.NOT_FOUND
