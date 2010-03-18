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
This module holds some utility functions.
"""
import settings
from copy import deepcopy
from models import Person
 

def get_atom_id_from_dycapo_id(id):
        """
        Converts a Dycapo Id to an Atom Id
        """
        return "urn:guid:"+settings.SITE_DOMAIN+":"+str(id)
    
def get_dycapo_id_from_atom_id(atom_id):
        """
        Converts an Atom Id to a Dycapo Id
        """
        splitted_atom_id = atom_id.split(':')
        dycapo_id = int(splitted_atom_id[-1])
        return dycapo_id

def atom_to_dycapo(dictionary):
        """
        Searches for a id key in a dictionary and converts it to a Dycapo internal Id
        """
        dycapo_dictionary = deepcopy(dictionary)
        try:
                dycapo_dictionary['id'] = get_dycapo_id_from_atom_id(dictionary['id'])
                return dycapo_dictionary
        except KeyError:
                return dycapo_dictionary

def populate_object_from_dictionary(obj,dictionary):
        for key in dictionary:
                obj.__dict__[key] = dictionary[key]
        if "Trip" in str(obj.__class__ ):
                try:
                        obj.id = get_dycapo_id_from_atom_id(dictionary['id'])
                except KeyError:
                        return obj
                return obj        
        if "Location" in str(obj.__class__ ):
                #return geopy_it(obj)
                return obj
        else:
                return obj

def synchronize_objects(old_obj,new_obj):
        for key in old_obj.__dict__:
                if key != 'id' and key!= '_state':
                        old_obj.__dict__[key] = new_obj.__dict__[key]
        return old_obj
                
def get_xmlrpc_user(kwargs):
    try:
        return Person.objects.get(username=kwargs['request'].META['REMOTE_USER'])
    except Person.DoesNotExist:
        return None

                