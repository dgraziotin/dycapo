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
This module holds the Response model
"""

class Response(object):
    """
    This is an envelope that standardizes the response of Dycapo.
    see http://dycapo.org/Protocol#Response
    """
    code = -1
    message = ""
    type = ""
    value = {}
    def __init__(self, code, message, type, value):
        self.code = code
        self.message = message
        self.type = type
        self.value = value

    def to_xmlrpc(self):
        return self.__dict__

    class Meta:
        app_label = 'server'
