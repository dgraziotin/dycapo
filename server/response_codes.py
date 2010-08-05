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
POSITIVE = 1
NEGATIVE = 0

OK = 200
CREATED = 201
NO_CONTENT = 204
UNAUTHORIZED = 401
NOT_FOUND = 404
UNSUPPORTED_MEDIA_TYPE = 415


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
