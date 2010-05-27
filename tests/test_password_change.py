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
        response = self.rider.client.dycapo.change_password(person)
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
        response = self.rider.client.dycapo.change_password(person)

    def test_password_change_successful_2(self):
        person = {
            "password" : "password",
        }
        self.rider.change_password("password1")
        response = self.rider.client.dycapo.change_password(person)
        assert response['code'] == response_codes.POSITIVE
        self.rider.change_password("password")
        
