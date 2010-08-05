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
This file must import all the XML-RPC methods
that we also want to expose to the public.
"""
from driver import insertTrip, startTrip, getRides
from driver import acceptRide, refuseRide, finishTrip
from passenger import searchRide, requestRide, statusRide, cancelRide, startRide, finishRide
from common import setPosition, getPosition, register, changePassword
