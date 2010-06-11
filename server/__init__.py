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
"""
This file must import all the XML-RPC methods
that we also want to expose to the public.
"""
from driver import add_trip, start_trip, check_ride_requests
from driver import accept_ride_request, refuse_ride_request, finish_trip
from rider import search_trip, request_ride, check_requested_ride, cancel_requested_ride, start_ride, finish_ride
from common import update_position, get_position, register, change_password
