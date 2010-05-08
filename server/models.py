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
from django.db import models
from django.contrib.auth.models import User, UserManager
from django.db import IntegrityError
from settings import GOOGLE_MAPS_API_KEY, SITE_DOMAIN
import geopy
import copy
from time import time
from datetime import datetime, timedelta

"""
This file contains all the models used in Dycapo. Each model is a port of the entities
described in OpenTrip Core specification (http://opentrip.info/wiki/OpenTrip_Core). 
Since we are going to propose the Dynamic extension for OpenTrip, every class attribute
is followed by an inline content, as follows:

# MUST - if the attribute MUST be present in an OpenTrip info
# OPT - if the attribute is optional
# RECOM - if the presence of the attribute is strongly recommended by OpenTrip
# EXT - if the attribute is an extension to the Core specification

The Dynamic Extension for OpenTrip also has attributes that must have a value. This is specified
by the blank=False option in the constructor of each model Field. 
All other attributes may be omitted
"""

"""
Tuples that represent possible choices for some fields
"""
GENDER_CHOICES = (
        (u'M', u'Male'),
        (u'F', u'Female'),
)

WAYPOINT_CHOICES = (
        (u'orig', u'Origin'),
        (u'dest', u'Destination'),
        (u'wayp', u'Waypoint'),
        (u'posi', u'Position'),
)

RECURS_CHOICES = (
        (u'weekly', u'Weekly'),
        (u'biweekly', u'Biweekly'),
        (u'monthly', u'Monthly'),
)

ROLE_CHOICES = (
        (u'rider', u'Rider'),
        (u'driver', u'Driver'),
)

MODE_CHOICES = (
        (u'auto', u'Auto'),
        (u'van', u'Van'),
        (u'bus', u'Bus'),
)

from geopy import distance

def now():
    now_seconds = time()
    now_date = datetime.fromtimestamp(now_seconds)
    return now_date.isoformat(' ')

def now_plus_days(num_days):
    now_seconds = time()
    now_date = datetime.fromtimestamp(now_seconds)
    nowplus = now_date + timedelta(days=num_days)
    return now_plus.isoformat(' ')

def now_minus_days(num_days):
    now_seconds = time()
    now_date = datetime.fromtimestamp(now_seconds)
    nowplus = now_date - timedelta(days=num_days)
    return now_minus.isoformat(' ')

def now_plus_minutes(num_minutes):
    now_seconds = time()
    now_date = datetime.fromtimestamp(now_seconds)
    nowplus = now_date + timedelta(minutes=num_minutes)
    return now_plus.isoformat(' ')

def now_minus_minutes(num_minutes):
    now_seconds = time()
    now_date = datetime.fromtimestamp(now_seconds)
    now_minus = now_date - timedelta(minutes=num_minutes)
    return now_minus.isoformat(' ')



"""
Dycapo models
"""

class Location(models.Model):
    """
    Represents a single location.
    See `OpenTrip_Core#Location_Constructs <http://opentrip.info/wiki/OpenTrip_Core#Location_Constructs>`_ for more info.
    """
    label = models.CharField(max_length=255, blank=True) # OPT
    street = models.CharField(max_length=255, blank=True)
    point = models.CharField(max_length=50, choices=WAYPOINT_CHOICES, blank=True) # OPT
    country = models.CharField(max_length=2, blank=True) # OPT
    region = models.CharField(max_length=255, blank=True) # OPT
    town = models.CharField(max_length=255, blank=True) # OPT
    postcode = models.PositiveIntegerField(blank=True,null=True,default=0) # OPT
    subregion = models.CharField(max_length=255, blank=True) # OPT
    georss_point = models.CharField(max_length=255, blank=True)  # RECOM
    """
    georss_pont_latitude and georss_point_longitude should be just used internally
    """
    georss_point_latitude = models.FloatField(null=True,default=0) #EXT
    georss_point_longitude = models.FloatField(null=True,default=0) #EXT
    """
    The following should be members of a separate Date-Time class but are included here for simplicity
    """
    offset = models.PositiveIntegerField(blank=True,null=True,default=0) # OPT
    recurs = models.CharField(max_length=255,blank=True) # OPT
    days = models.CharField(max_length=255, choices=RECURS_CHOICES,blank=True) # OPT
    leaves = models.DateTimeField(blank=True,null=True) # MUST
    
    def distance(self,location):
        """
        Returns the distance in KMs from this location to a given location
        """
        current_point = geopy.point.Point(self.georss_point)
        location_point = geopy.point.Point(location.georss_point)
        distance = geopy.distance.distance(current_point,location_point)
        return distance.kilometers
    
    def address_to_point(self):
        """
        Given Geolocation information, it retrieves GeoRSS.
        the return value of geocoder.geocode is in the form
        (u'Street name, Street Number, Postcode City Province, Country', (latitude, longitude))
        """
        try:
            geocoder = geocoders.Google(GOOGLE_MAPS_API_KEY)
            address = self.street + ", " + str(self.postcode) + " " + self.town
            geo_info = geocoder.geocode(address)
            self.georss_point = str(geo_info[1][0]) + ' ' +str(geo_info[1][1])
            point = geopy.point.Point.from_string(self.georss_point)
            self.georss_point_latitude = point.latitude
            self.georss_point_longitude = point.longitude
        except:
            self.georss_point = "0 0"
            self.georss_point_latitude = 0
            self.georss_point_longitude = 0
            raise ValueError('Could not retrieve Address information with the given GeoRSS point')
        self.georss_point_latitude = point.latitude
        self.georss_point_longitude = point.longitude
        
    def point_to_address(self):
        """
        Given GeoRSS point, it retrieves GeoLocation information in form of String
        the return value of geocoder.reverse is in the form
        (u'Street name, Street Number, Postcode City Province, Country', (latitude, longitude))
        """
        point = geopy.point.Point.from_string(self.georss_point)
        try:
            geocoder = geocoders.Google(GOOGLE_MAPS_API_KEY)
            geocoding_result = geocoder.reverse((point.latitude,point.longitude))
            full_address = geocoding_result[0].split(",")
            self.street = full_address[0] + ',' + full_address[1]
            self.postcode = int(full_address[2].split(" ")[1])
            full_town = full_address[2].split(" ")[2:]
            self.town = " ".join(full_town) 
        except:
            self.town = ""
            self.street = ""
            self.postcode = 0       
            #raise ValueError('Could not retrieve GeoRSS point information with the given Address.')     
        self.georss_point_latitude = point.latitude
        self.georss_point_longitude = point.longitude
            
    
    def save(self, *args, **kwargs):
        """
        Ensures integrity
        """
        if not self.point:
            raise IntegrityError('Attribute point must be given.')
        if not self.leaves:
            raise IntegrityError('Attribute leaves must be given.')
        if ((not self.street or not self.town or not self.postcode) and not self.georss_point):
            raise IntegrityError('Give either address details or georss_point')
        
        if not self.georss_point:
            """
            At this point we have Address details as string but not GeoRSS point.
            """
            self.address_to_point()
            super(Location, self).save(*args, **kwargs) # Call the "real" save() method.
        else:
            """
            At this point we have a GeoRSS point but not Address details
            """
            self.point_to_address()
            super(Location, self).save(*args, **kwargs) # Call the "real" save() method.
        
   
    def __unicode__(self):
        return self.georss_point
    
    def to_xmlrpc(self):
        location_dict = copy.deepcopy(self.__dict__)
        del location_dict['georss_point_latitude']
        del location_dict['georss_point_longitude']
        del location_dict['id']
        return location_dict

class Person(User):
    """
    Represents a Person as described on `OpenTrip_Core Person_Constructs <http://opentrip.info/wiki/OpenTrip_Core#Person_Constructs>`_.
    It's a subclass of django.contrib.auth.models.User. I use the technique described on
    `this blog <http://steps.ucdavis.edu/People/jbremson/extending-the-user-model-in-django>`_  to get Person objects
    instead of User objects when requesting a user.
    """
    
    # first_name from Django
    # last_name from Django
    # email from Django
    # last_login from Django
    # date_joined from Django
    # username from Django
    # password from Django
    uri = models.CharField(max_length=200,blank=True) # OPT
    phone = models.CharField(max_length=200,null=True) # OPT
    position = models.ForeignKey(Location,blank=True,null=True) # EXT
    age = models.PositiveIntegerField(null=True,default=0) # OPT
    gender = models.CharField(max_length=1, choices=GENDER_CHOICES,blank=False,null=True) # OPT
    smoker = models.BooleanField(default=False) # OPT
    blind = models.BooleanField(default=False) # OPT
    deaf = models.BooleanField(default=False) # OPT
    dog = models.BooleanField(default=False) # OPT
    locations = models.ManyToManyField(Location, related_name="locations", blank=True, null=True) # MUST
    
    class Meta:
        permissions = (
            ("can_xmlrpc", "Can perform XML-RPC to Dycapo"),
        )
        
     # Use UserManager to get the create_user method, etc.
    objects = UserManager()
    
    def __unicode__(self):
        return self.username
    
    def to_xmlrpc(self):
        """
        TODO:
        -use OpenTrip id, not Django internal id
        -choose what will be marshalled for Mode and Prefs objects
        -use django serializers instead of this
        -what else about the driver?
        """
        person_dict = {
            'username': self.username
        }
        return person_dict
    
    def get_recent_locations(self,minutes=10):
        recent_locations = self.locations.filter(leaves__gte=now_minus_minutes(minutes)).order_by('leaves')[:5]
        return recent_locations
    
        
class Mode(models.Model):
    """
    Represents additional information about the mode of transportation being used.
    See `OpenTrip_Core#Mode_Constructs <http://opentrip.info/wiki/OpenTrip_Core#Mode_Constructs>`_ for more info.
    """
    kind = models.CharField(max_length=255,choices=MODE_CHOICES,blank=False) # MUST
    capacity = models.PositiveIntegerField(blank=False,null=True,default=0) # OPT
    vacancy = models.PositiveIntegerField(blank=False,null=True,default=0) # OPT
    make = models.CharField(max_length=255,blank=True) # OPT
    model = models.CharField(max_length=255,blank=True) # OPT
    year = models.PositiveIntegerField(blank=True,null=True,default=0) # OPT
    color = models.CharField(max_length=255,blank=True) # OPT
    lic = models.CharField(max_length=255,blank=True) # OPT
    cost = models.FloatField(blank=True,null=True,default=0) # OPT
    
    def save(self, *args, **kwargs):
        """
        Ensures integrity
        """
        if not self.kind or not self.capacity or not self.vacancy or not self.make or not self.model or self.make=='cacca':
            raise IntegrityError('Attributes kind, capacity, vacancy, make, model MUST be given.')
        super(Mode, self).save(*args, **kwargs) # Call the "real" save() method.
        
    def to_xmlrpc(self):
        """
        Prepares the dictionary to be returned when returned as XML-RPC
        """
        mode_dict = copy.deepcopy(self.__dict__)
        del mode_dict['id']
        return mode_dict
        
    
class Prefs(models.Model):
    """
    Stores the preferences of a Trip set by the Person who creates it. 
    See `OpenTrip_Core#Preference_Constructs <http://opentrip.info/wiki/OpenTrip_Core#Preference_Constructs>`_ for more info.
    We kept drive and ride attributes just for compatibility reasons: in OpenTrip Dynamic just a driver should be
    the author of a Trip.
    """
    age = models.CharField(max_length=50,blank=True) # OPT
    nonsmoking = models.BooleanField(blank=True) # OPT
    gender = models.CharField(max_length=1, choices=GENDER_CHOICES,blank=True) # OPT
    drive = models.BooleanField(default=False) # OPT
    ride = models.BooleanField(default=False) # OPT
   
    def to_xmlrpc(self):
        """
        Prepares the dictionary to be returned when returned as XML-RPC
        """
        prefs_dict = copy.deepcopy(self.__dict__)
        del prefs_dict['id']
        return prefs_dict


class Trip(models.Model):
    """
    Represents a Trip. 
    See `OpenTrip_Core#Entry_Elements <http://opentrip.info/wiki/OpenTrip_Core#Entry_Elements>`_ for more info.
    atom:id, atom:title, atom:link are not present in the models of DyCapo. They should be returned
    in case of an export of a Trip in OpenTrip Feed format.
    TODO: return Prefs and Mode in XML_RPC
    """
    published = models.DateTimeField(auto_now_add=True, blank=False, null=True) # MUST
    updated = models.DateTimeField(auto_now=True, blank=False, null=True) # MUST
    expires = models.DateTimeField(blank=False, null=True) # MUST
    active = models.BooleanField(default=False) # MUST
    author = models.ForeignKey(Person,related_name='author', blank=False, null=True) # OPT
    locations = models.ManyToManyField(Location, blank=False) # MUST
    mode = models.ForeignKey(Mode, blank=False, null=True) # MUST
    prefs = models.ForeignKey(Prefs, null=True) # OPT
    participation = models.ManyToManyField(Person,through='Participation',related_name='participation') # EXT
    
    def __repr__(self):
        return str(self.id)
    
    def __unicode__(self):
        return str(self.id)
    
    def get_destination(self):
        destination = self.locations.filter(point='dest')[0]
        return destination
    
    def update_vacancy(self):
        """
        Checks how many seats are still available in car and updates the attribute consistently
        """
        participations_for_trip = Participation.objects.filter(trip=self).exclude(role='driver').filter(started=True).filter(finished=False)
        self.mode.vacancy = len(participations_for_trip)
        self.mode.save()
        
    def has_vacancy(self):
        if self.mode.capacity - self.mode.vacancy > 0:
            return True
        return False
        
    
    def save(self, *args, **kwargs):
        if not self.expires or not self.mode or not self.prefs or not self.author:
            raise IntegrityError('Trip objects MUST have expires and content attributes.')
        super(Trip, self).save(*args, **kwargs) # Call the "real" save() method.
    


    
    def to_xmlrpc(self):
        """
        Prepares the dictionary to be returned when riders search a ride.
        TODO:
        -choose what will be marshalled for Mode and Prefs objects
        -what else about the driver?
        """
        locations = self.locations.all()
        locations_dict = []
        for location in locations:
            locations_dict.append(location.to_xmlrpc())
        trip_dict = {
            'id' : self.id,
            'published' : self.published,
            'updated': self.updated,
            'expires': self.expires,
            'content': {'mode': self.mode.to_xmlrpc(), 'prefs' : self.prefs.to_xmlrpc(), 'locations' : locations_dict},
            'author': self.author.to_xmlrpc(),
        }
        return trip_dict
    
class Participation(models.Model):
    """
    Describes the participation of a Person in a Trip.
    This is an OpenTrip extension and should be considered as a proposal for OpenTrip Dynamic.
    It is currently used internally in Dycapo
    """
    person = models.ForeignKey(Person, related_name="participant") # used internally
    trip = models.ForeignKey(Trip, related_name="trip") # used internally
    role = models.CharField(max_length=6,choices=ROLE_CHOICES,blank=False) # EXT
    requested = models.BooleanField(blank=False, default=False) # EXT
    requested_timestamp = models.DateTimeField(auto_now_add=False, blank=False, null=True) # EXT
    requested_position = models.ForeignKey(Location,related_name="requested_position",blank=True,null=True) # EXT
    accepted = models.BooleanField(blank=False, default=False) # EXT
    accepted_timestamp = models.DateTimeField(auto_now_add=False, blank=False, null=True) # EXT
    accepted_position = models.ForeignKey(Location,related_name="accepted_position",blank=True,null=True) # EXT
    started = models.BooleanField(blank=False, default=False) # EXT
    started_timestamp = models.DateTimeField(auto_now_add=False, blank=False, null=True) # EXT
    started_position = models.ForeignKey(Location,related_name="started_position",blank=True,null=True) # EXT    
    finished = models.BooleanField(blank=False, default=False) # EXT    
    finished_timestamp = models.DateTimeField(auto_now_add=False, blank=False, null=True) # EXT
    finished_position = models.ForeignKey(Location,related_name="finished_position",blank=True,null=True) # EXT

    
    def __unicode__(self):
        return str(self.person) + " -> " + str(self.trip)
    
    
class LocationManager(models.Manager):
    """
    For using http://docs.djangoproject.com/en/dev/topics/serialization/ to serialize a Location. TODO.
    """
    def get_by_natural_key(self, georss_point):
        return self.get(georss_point=georss_point)
    
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
        
    def to_xmlrpc(self):
        return self.__dict__
