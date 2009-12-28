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
This file contains classes and functions shared by tests.
"""
from datetime import datetime, timedelta
from time import time,sleep
from xmlrpclib import ServerProxy
import random

def now():
    now_seconds = time()
    now_date = datetime.fromtimestamp(now_seconds)
    return now_date.isoformat(' ')

def nowplusdays(num_days):
    now_seconds = time()
    now_date = datetime.fromtimestamp(now_seconds)
    nowplus = now_date + timedelta(days=num_days)
    return nowplus.isoformat(' ')

def nowplusminutes(num_minutes):
    now_seconds = time()
    now_date = datetime.fromtimestamp(now_seconds)
    nowplus = now_date + timedelta(minutes=num_minutes)
    return nowplus.isoformat(' ')

def get_client(user, password, domain):
        url = "https://" + user + ":" + password + "@" + domain
        client = ServerProxy(url)
        return client
        
def wait_random_seconds():
    wait = random.randrange(1,20)
    print "Waiting " + str(wait)
    sleep(wait)
    
class Location():
    town = ''
    georss_radius = ''
    point = ''
    georss_point = ''
    country = ''
    region = ''
    offset = ''
    subregion = ''
    days = ''
    label = ''
    street = ''
    georss_box = ''
    postcode = ''
    address = ''
    leaves = ''
    intersection = ''
    recurs = ''

class Trip():
    expires = ''
    content = ''


class Mode():
    kind = ''
    capacity = 0
    lic = ''
    color = ''
    make = ''
    vacancy = 0
    cost = 0
    year = 0
    model = ''
