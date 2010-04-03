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
This module holds all the XML-RPC methods that a driver and a rider have in common
"""
from rpc4django import rpcmethod
from models import Location, Person, Mode, Prefs, Trip, Response
"""
@rpcmethod(name='dycapo.update_position', signature=['Response','Location'], permission='server.can_xmlrpc')
def update_position(location):
    dict_position = location
    position = Location()
    position = populate_object_from_dictionary(position,dict_position)
    user = get_xmlrpc_user(kwargs)
    user.position = position
    resp = Response(response_codes.POSITIVE,response_codes.POSITION_UPDATED,str(True.__class__),True)
    return resp
"""