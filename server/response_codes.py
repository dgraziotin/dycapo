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
This module contains response codes and messages
"""
POSITIVE = 1
NEGATIVE = 0


PROTOCOL_ERROR = "Please give all required parameters."
TRIP_INSERTED = "Trip successfully inserted."
TRIP_STARTED = "Trip successfully started."
TRIP_STARTED = "Trip already started."
TRIP_DELETED = ""
TRIP_NOT_FOUND = """Trip not found. Please specify at least a
                    valid id attribute."""
TRIP_PROTOCOL_ERROR = """Protocol Error. Trip attributes expires and content
                      MUST be provided."""
RIDE_REQUESTS_NOT_FOUND = "Ride requests not found."
RIDE_REQUESTS_FOUND = "Ride requests found."
RIDE_REQUEST_ACCEPTED = "Ride request accepted."
RIDE_REQUEST_NOT_YET_ACCEPTED = "Ride request not yet accepted."
RIDE_REQUEST_REFUSED = "Ride request refused."
RIDES_NOT_FOUND = "Rides not found."
RIDES_FOUND = "Rides found."
RIDE_REQUESTED = "Ride successfully requested."
RIDE_STARTED = "Ride succesfully started."
RIDE_IN_COURSE = "Rider is already participating"
MUST_FIRST_REQUEST_RIDE = "You must first request a ride"
POSITION_UPDATED = "Current Position successfully updated"
POSITION_FOUND = "Position found"
PERSON_PROTOCOL_ERROR = "Please give all the required attribute"
PERSON_NOT_FOUND = "Person(s) not found."
PERSON_PASSWORD_CHANGED = "Password successfully changed"
PERSON_REGISTERED = "Person succesfully registered."
PERSON_ALREADY_REGISTERED = "Person already registered."
PERSON_FOUND = "Person(s) found"
PERSON_DELETED_REQUESTED_RIDE = "Person deleted the ride requested."
LOCATION_NOT_FOUND = "Location not available"
