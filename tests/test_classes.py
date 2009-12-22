from datetime import datetime, timedelta
from time import time
from xmlrpclib import ServerProxy

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
    

class DycapoConnect():
    url= ''
    client = ''
    def __init__(self, url):
        self.url = url
        self.client = ServerProxy(url)
        

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
