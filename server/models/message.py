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
import django.core.exceptions

class Message(django.core.exceptions.ValidationError):
    """
    This class acts as a wrapper for all communications from Dycapo to clients.
    It is used for both standard information and error communication
    """
    def __init__(self, message, code=None, params=None):
        if not isinstance(message, dict):
            message = {
                "_message" : str(message)
            }
        django.core.exceptions.ValidationError.__init__(self, message, code, params)

    def to_xmlrpc(self):
        return self.__dict__

    class Meta:
        app_label = 'server'
