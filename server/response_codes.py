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

"""
This module contains response codes and messages
"""
import piston.utils as piston

ALL_OK = piston.rc.ALL_OK.status_code
CREATED = piston.rc.CREATED.status_code
DELETED = piston.rc.DELETED.status_code
FORBIDDEN = piston.rc.FORBIDDEN.status_code
NOT_FOUND = piston.rc.NOT_FOUND.status_code
BAD_REQUEST = piston.rc.BAD_REQUEST.status_code
DUPLICATE_ENTRY = piston.rc.DUPLICATE_ENTRY.status_code

"""
rc.ALL_OK	200 OK	        Everything went well.
rc.CREATED	201 Created	Object was created.
rc.DELETED	204 (Emtpy body, as per RFC2616)	Object was deleted.
rc.BAD_REQUEST	400 Bad Request	Request was malformed/not understood.
rc.FORBIDDEN	401 Forbidden	Permission denied.
rc.DUPLICATE_ENTRY	409 Conflict/Duplicate	Object already exists.
rc.NOT_FOUND	404 Not found	Object does not exist.
rc.NOT_IMPLEMENTED	501 Not Implemented	Action not available.
rc.THROTTLED	503 Throttled	Request was throttled.
"""


PROTOCOL_ERROR = "Please give all required parameters."
TRIP_INSERTED = "Trip successfully inserted."
TRIP_STARTED = "Trip successfully started."
TRIP_STARTED = "Trip already started."
TRIP_DELETED = "Trip succesfully closed."
TRIP_NOT_DELETED = "Could not close Trip. Please contact Dycapo administrators."
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
