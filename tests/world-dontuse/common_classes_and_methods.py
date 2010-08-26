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
This file contains classes and functions shared by tests.
"""
from datetime import datetime, timedelta
from time import time,sleep
from xmlrpclib import ServerProxy
import random

delta_lat = 0.00286
delta_lon = 0.00054

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
    #self.town = ''#'Trento'
    #self.georss_radius = 500
        self.point = 'orig'
        self.georss_point = ''
        #self.country = '' #'IT'
        #self.region = '' #'Trentino-Alto Adige'
        self.offset = 30
        #self.subregion = '' #'Trentino'
        #self.days = '' #'MTW'
        self.label = 'Home'
        #self.street = ''#'Via Sommarive'
        #self.georss_box = ''#'46.06693 11.15065 46.20000 11.20000'
        self.postcode = 0 #38100
        #self.address = '' #'18 Via Sommarive, 38100 Trento'
        self.leaves = ''
        #self.intersection = '' #'Via Sommarive'
        #self.recurs = ''#'weekly'

class Trip():
    expires = ''
    content = ''


class Modality():
    kind = ''
    capacity = 0
    lic = ''
    color = ''
    make = ''
    vacancy = 0
    cost = 0
    #year = 0
    model_name = ''

class Preferences():
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
