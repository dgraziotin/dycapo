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
Collects all REST handlers contained in wrappers defined in wrappers package,
letting Piston know about their existance
"""
from wrappers.person import PersonHandler
from wrappers.participation import ParticipationHandler
from wrappers.preferences import PreferencesHandler
from wrappers.modality import ModalityHandler
from wrappers.location import LocationHandler, LocationPersonHandler
from wrappers.search import SearchHandler
from wrappers.trip import TripHandler
from wrappers.api import ApiHandler