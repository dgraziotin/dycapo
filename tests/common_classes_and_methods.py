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

def get_client(user, password, url):
        protocol = url.split(':')[0]
        host_and_path = url.split(':')[1][2:]
        url = protocol +"://" + user + ":" + password + "@" + host_and_path
        client = ServerProxy(url)
        return client
        
def wait_random_seconds():
    wait = random.randrange(1,20)
    print "Waiting " + str(wait) + " seconds"
    sleep(wait)
    
def extract_response(response):
    return response['value']
    
class Location():
    town = 'Trento'
    georss_radius = 500
    point = ''
    georss_point = ''
    country = 'IT'
    region = 'Trentino-Alto Adige'
    offset = ''
    subregion = 'Trentino'
    days = 'MTW'
    label = 'Work'
    street = 'Via Sommarive'
    georss_box = '46.06693 11.15065 46.20000 11.20000'
    postcode = 38100
    address = '18 Via Sommarive, 38100 Trento'
    leaves = ''
    intersection = 'Via Sommarive'
    recurs = 'weekly'
    def __init__(self):
        self.town = 'Trento'
        self.georss_radius = 500
        self.point = ''
        self.georss_point = ''
        self.country = 'IT'
        self.region = 'Trentino-Alto Adige'
        self.offset = 30
        self.subregion = 'Trentino'
        self.days = 'MTW'
        self.label = 'Work'
        self.street = 'Via Sommarive'
        self.georss_box = '46.06693 11.15065 46.20000 11.20000'
        self.postcode = 38100
        self.address = '18 Via Sommarive, 38100 Trento'
        self.leaves = ''
        self.intersection = 'Via Sommarive'
        self.recurs = 'weekly'

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
    
class Prefs():
    age = '18-30'
    nonsmoking = False
    
class Person():
    username = ''

    
class Response(object):
    """
    This is an envelope that standardizes the response of Dycapo. This is an OpenTrip Dynamic proposal.
    """
    code = -1
    message = ""
    type = ""
    value = {}
    def __init__(self,code,message,type,value):
        self.code = code
        self.message = message
        self.type = type
        self.value = value

