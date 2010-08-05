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

from datetime import datetime, timedelta
from time import time
from xmlrpclib import ServerProxy
import settings


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

def nowminusminutes(num_minutes):
    now_seconds = time()
    now_date = datetime.fromtimestamp(now_seconds)
    nowplus = now_date - timedelta(minutes=num_minutes)
    return nowplus.isoformat(' ')

def get_xmlrpc_client(user, password, url):
    protocol = url.split(':')[0]
    host_and_path = url.split(':')[1][2:]
    url = protocol +"://" + user + ":" + password + "@" + host_and_path
    client = ServerProxy(url)
    return client

def georss_point_from_coords(latitude, longitude):
    return str(latitude) + " " + str(longitude)

def coords_from_georss_point(georss_point):
    georss_point_splitted = georss_point.split()
    return [float(coord) for coord in georss_point_splitted]

def extract_response(response):
    return response['value']
