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

class TestRegistration():

    def setup_class(self):
        self.rider = classes.Rider(settings.REGISTRATION_USERNAME,settings.REGISTRATION_PASSWORD,settings.DYCAPO_URL)
        self.rider.position_lat = 46.494957
        self.rider.position_lon = 11.340239
        self.rider_position = utils.georss_point_from_coords(self.rider.position_lat, self.rider.position_lon)

    def setup_method(self,method):
        pass

    def test_registration(self):
        person = {
            "username" : "blahhhh",
            "password" : "password",
            "email" : "blah@blah.com",
            "phone" : "12323123",
        }
        response = self.rider.client.dycapo.register(person)
        if response['code'] == response_codes.ERROR:
            print str(response)
        assert response['code'] != response_codes.ERROR
        person = {
            "username" : "driver1",
            "password" : "password",
            "email" : "driver@drivers.com",
            "phone" : "1232332433",
        }
        response = self.rider.client.dycapo.register(person)
        if response['code'] == response_codes.ERROR:
            print str(response)
        assert response['code'] != response_codes.ERROR
        person = {
            "username" : "rider1",
            "password" : "password",
            "email" : "rider@riders.com",
            "phone" : "1232332433",
        }

        if response['code'] == response_codes.ERROR:
            print str(response)
        assert response['code'] != response_codes.ERROR
        response = self.rider.client.dycapo.register(person)
        person = {
            "username" : "dio",
            "password" : "password",
            "email" : "dio@ronniejamesdio.com",
            "phone" : "1232333242343",
        }
        if response['code'] == response_codes.ERROR:
            print str(response)
        assert response['code'] != response_codes.ERROR
        response = self.rider.client.dycapo.register(person)
        person = {
            "username" : "rob",
            "password" : "password",
            "email" : "rob@judaspriest.com",
            "phone" : "1232349033",
        }
        if response['code'] == response_codes.ERROR:
            print str(response)
        assert response['code'] != response_codes.ERROR
        response = self.rider.client.dycapo.register(person)
        person = {
            "username" : "ozzy",
            "password" : "password",
            "email" : "ozzy@acdcd.com",
            "phone" : "12322341433",
        }
        if response['code'] == response_codes.ERROR:
            print str(response)
        assert response['code'] != response_codes.ERROR
        response = self.rider.client.dycapo.register(person)
        person = {
            "username" : "angela",
            "password" : "password",
            "email" : "angela@archenemy.com",
            "phone" : "1232332043",
        }
        if response['code'] == response_codes.ERROR:
            print str(response)
        assert response['code'] != response_codes.ERROR
        response = self.rider.client.dycapo.register(person)
