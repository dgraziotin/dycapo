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

ALL_OK = 200
CREATED = 201
DELETED = 204
FORBIDDEN = 401
NOT_FOUND = 404
BAD_REQUEST = 400
DUPLICATE_ENTRY = 409

"""
rc.ALL_OK       200 OK          Everything went well.
rc.CREATED      201 Created     Object was created.
rc.DELETED      204 (Emtpy body, as per RFC2616)        Object was deleted.
rc.BAD_REQUEST  400 Bad Request Request was malformed/not understood.
rc.FORBIDDEN    401 Forbidden   Permission denied.
rc.DUPLICATE_ENTRY      409 Conflict/Duplicate  Object already exists.
rc.NOT_HERE     410 Gone        Object does not exist.
rc.NOT_IMPLEMENTED      501 Not Implemented     Action not available.
rc.THROTTLED    503 Throttled   Request was throttled.
"""
