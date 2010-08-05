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
import xmlrpclib

class TestPasswordChange():

    def setup_class(self):
        self.rider = classes.Rider(settings.RIDER_USERNAME,settings.RIDER_PASSWORD,settings.DYCAPO_URL)
        self.rider.position_lat = 46.494957
        self.rider.position_lon = 11.340239
        self.rider_position = utils.georss_point_from_coords(self.rider.position_lat, self.rider.position_lon)

    def setup_method(self,method):
        pass

    def test_password_change_successful(self):
        person = {
            "password" : "password1",
        }
        response = self.rider.client.dycapo.changePassword(person)
        print str(response)
        assert response['code'] == response_codes.POSITIVE
    def test_password_change_exception(self):
        import py.test
        py.test.raises(xmlrpclib.ProtocolError, "self.password_change_unsuccesful()")

    def password_change_unsuccesful(self):

        #Must raise a ProtocolError exception

        person = {
            "password" : "password1",
        }
        response = self.rider.client.dycapo.changePassword(person)

    def test_password_change_successful_2(self):
        person = {
            "password" : "password",
        }
        self.rider.change_password("password1")
        response = self.rider.client.dycapo.changePassword(person)
        assert response['code'] == response_codes.POSITIVE
        self.rider.change_password("password")
