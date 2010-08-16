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

ALREADY_REGISTERED = 'Person already registered.'

class TestRegistration():

    def setup_class(self):
        self.rider = classes.Rider(settings.REGISTRATION_USERNAME,settings.REGISTRATION_PASSWORD,settings.DYCAPO_URL)
        self.rider.position_lat = 46.494957
        self.rider.position_lon = 11.340239
        self.rider_position = utils.georss_point_from_coords(self.rider.position_lat, self.rider.position_lon)
    def setup_method(self,method):
        pass

    def test_registration_dummy(self):
        person = {
            "username" : "blahhhh",
            "password" : "password",
            "email" : "blah@blah.com",
            "phone" : "12345",
        }
        response = self.rider.client.dycapo.register(person)
        assert response['code'] == response_codes.CREATED or response['code'] == response_codes.DUPLICATE_ENTRY

    def test_registrations_real(self):
        person = {
            "username" : "driver1",
            "password" : "password",
            "email" : "driver@drivers.com",
            "phone" : "123456",
        }
        response = self.rider.client.dycapo.register(person)
        assert response['code'] == response_codes.CREATED or response['code'] == response_codes.DUPLICATE_ENTRY
        person = {
            "username" : "rider1",
            "password" : "password",
            "email" : "rider@riders.com",
            "phone" : "1234567",
        }

        response = self.rider.client.dycapo.register(person)
        assert response['code'] == response_codes.CREATED or response['code'] == response_codes.DUPLICATE_ENTRY

        person = {
            "username" : "dio",
            "password" : "password",
            "email" : "dio@ronniejamesdio.com",
            "phone" : "12345678",
        }

        response = self.rider.client.dycapo.register(person)
        assert response['code'] == response_codes.CREATED or response['code'] == response_codes.DUPLICATE_ENTRY
        person = {
            "username" : "rob",
            "password" : "password",
            "email" : "rob@judaspriest.com",
            "phone" : "123456789",
        }

        response = self.rider.client.dycapo.register(person)
        assert response['code'] == response_codes.CREATED or response['code'] == response_codes.DUPLICATE_ENTRY
        person = {
            "username" : "ozzy",
            "password" : "password",
            "email" : "ozzy@acdcd.com",
            "phone" : "1234567890",
        }
        assert response['code'] != response_codes.BAD_REQUEST or response_codes.NOT_HERE
        response = self.rider.client.dycapo.register(person)

        person = {
            "username" : "bruce",
            "password" : "password",
            "email" : "bruce@ironmaiden.com",
            "phone" : "1234567801324",
        }
        response = self.rider.client.dycapo.register(person)
        assert response['code'] == response_codes.CREATED or response['code'] == response_codes.DUPLICATE_ENTRY

        person = {
            "username" : "angela",
            "password" : "password",
            "email" : "angela@archenemy.com",
            "phone" : "12345678901",
        }
        response = self.rider.client.dycapo.register(person)
        assert response['code'] == response_codes.CREATED or response['code'] == response_codes.DUPLICATE_ENTRY

    def test_unvalid_registration(self):
        person = {
            "username" : "angela",
            "password" : "password",
            "email" : "angela@archenemy.com",
            "phone" : "12345678901",
        }
        response = self.rider.client.dycapo.register(person)
        assert response['code'] == response_codes.DUPLICATE_ENTRY
