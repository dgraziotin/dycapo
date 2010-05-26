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

class TestRider():
    def setup_class(self):
        self.driver = classes.Driver(settings.DRIVER_USERNAME,settings.DRIVER_PASSWORD,settings.DYCAPO_URL)
        self.rider = classes.Rider(settings.RIDER_USERNAME,settings.RIDER_PASSWORD,settings.DYCAPO_URL)
        self.driver_position = '46.490200 11.342294'
        self.driver_destination = '46.500740 11.345073'
        self.rider_position = '46.494957  11.340239'
        self.rider_destination = '46.500891  11.344306'


    def setup_method(self,method):
        self.driver.position = classes.Location(georss_point=self.driver_position)
        self.driver.destination = classes.Location(georss_point=self.driver_destination,point='dest')
        self.rider.position = classes.Location(georss_point=self.rider_position)
        self.rider.destination = classes.Location(georss_point=self.rider_destination,point='dest')

    def test_position(self):
        old_position = self.rider.position
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
        response = self.rider.search_ride(self.rider.position,self.rider.destination)
        assert response['code'] == response_codes.NEGATIVE
    
    def test_request_ride(self,trip=None):
        if not trip:
            if not hasattr(self,"trip"):
                self.trip = classes.Trip()
            trip = self.trip
            trip.author = ""
            trip.mode = ""
            trip.prefs = ""
            trip.mode = ""
            trip.locations = []
        response = self.rider.request_ride(trip)
        assert response['code'] == response_codes.ERROR
    """
    def test_start_ride(self,trip=None):
        if not trip:
            if not hasattr(self,"trip"):
                self.trip = classes.Trip()
            trip = self.trip
        response = self.rider.start_ride(trip)
        assert response['code'] == response_codes.ERROR

    def test_finish_ride(self,trip=None):
        if not trip:
            if not hasattr(self,"trip"):
                self.trip = classes.Trip()
            trip = self.trip
        response = self.rider.finish_ride(trip)
        assert response['code'] == response_codes.ERROR
    """
