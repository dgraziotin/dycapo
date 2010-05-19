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
