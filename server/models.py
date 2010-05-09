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
    label = models.CharField(max_length=255, blank=True)
    street = models.CharField(max_length=255, blank=True)
    point = models.CharField(max_length=50, choices=WAYPOINT_CHOICES, blank=True)
    country = models.CharField(max_length=2, blank=True)
    region = models.CharField(max_length=255, blank=True)
    town = models.CharField(max_length=255, blank=True)
    postcode = models.PositiveIntegerField(blank=True,null=True,default=0)
    subregion = models.CharField(max_length=255, blank=True)
    georss_point = models.CharField(max_length=255, blank=True)
    """
    georss_pont_latitude and georss_point_longitude should be just used internally
    """
    georss_point_latitude = models.FloatField(null=True,default=0)
    georss_point_longitude = models.FloatField(null=True,default=0)
    """
    The following should be members of a separate Date-Time class but are included here for simplicity
    """
    offset = models.PositiveIntegerField(blank=True,null=True,default=0)
    recurs = models.CharField(max_length=255,blank=True)
    days = models.CharField(max_length=255, choices=RECURS_CHOICES,blank=True)
    leaves = models.DateTimeField(blank=True,null=True)
    
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
        """
        Returns a Python dict that contains just the attributes we want to expose
        in out XML-RPC methods
        """
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
    uri = models.CharField(max_length=200,blank=True)
    phone = models.CharField(max_length=200,null=True)
    position = models.ForeignKey(Location,blank=True,null=True)
    age = models.PositiveIntegerField(null=True,default=0)
    gender = models.CharField(max_length=1, choices=GENDER_CHOICES,blank=False,null=True)
    smoker = models.BooleanField(default=False)
    blind = models.BooleanField(default=False)
    deaf = models.BooleanField(default=False)
    dog = models.BooleanField(default=False)
    locations = models.ManyToManyField(Location, related_name="person_locations", blank=True, null=True) # MUST
    
    def get_recent_locations(self,max_results=10):
        """
        Returns the last n locations of a Person. If the person is participating
        in a Trip as a Driver, it directly returns the last n locations stored
        in the Participation, for having better results in research algorithms
        """
        if self.get_active_participation() and self.get_active_participation().role=='driver':
                participation = self.get_active_participation()
                recent_locations = list(participation.locations.all().order_by('-id')[:max_results])
        else:
                recent_locations = list(self.locations.all().order_by('-id')[:max_results])
        recent_locations.reverse()
        return recent_locations
    
    def is_participating(self):
        """
        Returns true if the Person is actively participating in a Trip
        """
        participations = Participation.objects.filter(started=True,finished=False,person=self,trip__active=True)
        if not participations: return False
        return True

    def get_active_participation(self):
        """
        Returns the currently Participation of the Person in a Trip.
        """
        participations = Participation.objects.filter(started=True,finished=False,person=self,trip__active=True)
        if not participations: return None
        # TODO: we should purge here in case of multiple Participations returned
        if len(participations) > 1: return None
        return participations[0]

    def get_participating_trip(self):
        """
        Returns the Trip in which the Person is Participating
        """
        participations = Participation.objects.filter(started=True,finished=False,person=self,trip__active=True)
        if not participations: return None
        # TODO: we should purge here in case of multiple Participations returned
        if len(participations) > 1: return None
        return participations[0].trip
        
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
        Returns a Python dict that contains just the attributes we want to expose
        in out XML-RPC methods
        """
        person_dict = {
            'username': self.username
        }
        return person_dict
    
        
class Mode(models.Model):
    """
    Represents additional information about the mode of transportation being used.
    See `OpenTrip_Core#Mode_Constructs <http://opentrip.info/wiki/OpenTrip_Core#Mode_Constructs>`_ for more info.
    """
    kind = models.CharField(max_length=255,choices=MODE_CHOICES,blank=False)
    capacity = models.PositiveIntegerField(blank=False,null=True,default=0)
    vacancy = models.PositiveIntegerField(blank=False,null=True,default=0)
    make = models.CharField(max_length=255,blank=True)
    model = models.CharField(max_length=255,blank=True)
    year = models.PositiveIntegerField(blank=True,null=True,default=0)
    color = models.CharField(max_length=255,blank=True)
    lic = models.CharField(max_length=255,blank=True)
    cost = models.FloatField(blank=True,null=True,default=0)
    
    def save(self, *args, **kwargs):
        """
        Ensures integrity
        """
        if not self.kind or not self.capacity or not self.vacancy or not self.make or not self.model or self.make=='cacca':
            raise IntegrityError('Attributes kind, capacity, vacancy, make, model MUST be given.')
        super(Mode, self).save(*args, **kwargs) # Call the "real" save() method.
        
    def to_xmlrpc(self):
        """
        Returns a Python dict that contains just the attributes we want to expose
        in out XML-RPC methods
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
    age = models.CharField(max_length=50,blank=True)
    nonsmoking = models.BooleanField(blank=True)
    gender = models.CharField(max_length=1, choices=GENDER_CHOICES,blank=True)
    drive = models.BooleanField(default=False)
    ride = models.BooleanField(default=False)
   
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
    published = models.DateTimeField(auto_now_add=True, blank=False, null=True)
    updated = models.DateTimeField(auto_now=True, blank=False, null=True)
    expires = models.DateTimeField(blank=False, null=True)
    active = models.BooleanField(default=False)
    author = models.ForeignKey(Person,related_name='author', blank=False, null=True)
    locations = models.ManyToManyField(Location, blank=False)
    mode = models.ForeignKey(Mode, blank=False, null=True)
    prefs = models.ForeignKey(Prefs, null=True)
    participation = models.ManyToManyField(Person,through='Participation',related_name='participation')
    
    def __repr__(self):
        return str(self.id)
    
    def __unicode__(self):
        return str(self.id)
    
    def get_destination(self):
        """
        Returns the location representing the destination of the Trip
        """
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
        """
        Returns True if there are emtpy seats available
        """
        if self.mode.capacity - self.mode.vacancy > 0:
            return True
        return False
        
    
    def save(self, *args, **kwargs):
        """
        Ensures integrity.
        """
        if not self.expires or not self.mode or not self.prefs or not self.author:
            raise IntegrityError('Trip objects MUST have expires and content attributes.')
        super(Trip, self).save(*args, **kwargs) # Call the "real" save() method.
    
    def get_participations():
        """
        Returns all the Participations of the Trip
        """
        participations = Participation.objects.filter(trip=self)
        return participations

    
    def to_xmlrpc(self):
        """
        Returns a Python dict that contains just the attributes we want to expose
        in out XML-RPC methods
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
    person = models.ForeignKey(Person, related_name="participant")
    trip = models.ForeignKey(Trip, related_name="trip")
    role = models.CharField(max_length=6,choices=ROLE_CHOICES,blank=False)
    requested = models.BooleanField(blank=False, default=False)
    requested_timestamp = models.DateTimeField(auto_now_add=False, blank=False, null=True)
    requested_position = models.ForeignKey(Location,related_name="requested_position",blank=True,null=True)
    accepted = models.BooleanField(blank=False, default=False)
    accepted_timestamp = models.DateTimeField(auto_now_add=False, blank=False, null=True)
    accepted_position = models.ForeignKey(Location,related_name="accepted_position",blank=True,null=True)
    started = models.BooleanField(blank=False, default=False)
    started_timestamp = models.DateTimeField(auto_now_add=False, blank=False, null=True)
    started_position = models.ForeignKey(Location,related_name="started_position",blank=True,null=True) 
    finished = models.BooleanField(blank=False, default=False)
    finished_timestamp = models.DateTimeField(auto_now_add=False, blank=False, null=True)
    finished_position = models.ForeignKey(Location,related_name="finished_position",blank=True,null=True)
    locations = models.ManyToManyField(Location, related_name="participaion_locations")

    
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
