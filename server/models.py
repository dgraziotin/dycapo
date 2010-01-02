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
from geopy import geocoders
from geopy.point import Point

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
    point = models.CharField(max_length=50, choices=WAYPOINT_CHOICES, blank=False) # OPT
    country = models.CharField(max_length=2, blank=True) # OPT
    region = models.CharField(max_length=255, blank=True) # OPT
    town = models.CharField(max_length=255, blank=True) # OPT
    postcode = models.PositiveIntegerField(blank=True,null=True) # OPT
    subregion = models.CharField(max_length=255, blank=True) # OPT
    intersection = models.CharField(max_length=255, blank=True) # OPT
    address = models.CharField(max_length=255, blank=True) # OPT
    georss_point = models.CharField(max_length=255, blank=True)  # RECOM
    """
    georss_pont_latitude and georss_point_longitude should be just used internally
    """
    georss_point_latitude = models.FloatField(null=True) #EXT
    georss_point_longitude = models.FloatField(null=True) #EXT
    georss_radius = models.PositiveIntegerField(blank=True,null=True) # OPT
    georss_box = models.CharField(max_length=255, blank=True) # OPT
    """
    The following should be members of a separate Date-Time class but are included here for simplicity
    """
    offset = models.PositiveIntegerField(blank=True,null=True) # OPT
    recurs = models.CharField(max_length=255,blank=True) # OPT
    days = models.CharField(max_length=255, choices=RECURS_CHOICES,blank=True) # OPT
    leaves = models.DateTimeField(blank=False) # MUST
    
    def slit_georss_point(self):
        if self.georss_point !=  '':
            try:
                point.P
                self.georss_point_lat = float(georss_point_splitted[0])
                self.georss_point_lon = float(georss_point_splitted[1])
            except:
                raise ValueError('georss_point does not have a valid value')
            
    
    def save(self, force_insert=False, force_update=False):
        """
        Ensures integrity
        """
        if self.address == "" and self.georss_point == "":
            raise IntegrityError('either address or georss_point must have a value')
        if self.georss_point != "":
            point = Point.from_string(self.georss_point)
            self.georss_point_latitude = point.latitude
            self.georss_point_longitude = point.longitude
            self.geopy_it()
        super(Location, self).save(force_insert, force_update) # Call the "real" save() method.
        
    def geopy_it(self):
        """
        TODO: popoulate a Location object using geopy
        """
        pass
    
    def natural_key(self):
        """
        Will be used in serialization. Work in progress
        """
        return (self.georss_point)
    
    def __unicode__(self):
        return self.georss_point

class Person(User):
    """
    Represents a Person as described on `OpenTrip_Core Person_Constructs <http://opentrip.info/wiki/OpenTrip_Core#Person_Constructs>`_.
    It's a subclass of django.contrib.auth.models.User. I use the technique described on
    `this blog <http://steps.ucdavis.edu/People/jbremson/extending-the-user-model-in-django>`_  to get Person objects
    instead of User objects when requesting a user.
    """
    name = models.CharField(max_length=200) # MUST
    alias = models.CharField(max_length=200,blank=True) # OPT
    userid = models.CharField(max_length=200,blank=False) # MUST
    #email is a field of django User model
    #email = models.CharField(max_length=200) # OPT
    uri = models.CharField(max_length=200,blank=True) # OPT
    phone = models.CharField(max_length=200,blank=False) # OPT
    position = models.ForeignKey(Location,blank=True,null=True) # EXT
    age = models.PositiveIntegerField(null=True) # OPT
    gender = models.CharField(max_length=1, choices=GENDER_CHOICES,blank=False) # OPT
    smoker = models.BooleanField(default=False) # OPT
    blind = models.BooleanField(default=False) # OPT
    deaf = models.BooleanField(default=False) # OPT
    dog = models.BooleanField(default=False) # OPT
    
    class Meta:
        permissions = (
            ("can_xmlrpc", "Can perform XML-RPC to Dycapo"),
        )
        
     # Use UserManager to get the create_user method, etc.
    objects = UserManager()

    
class Mode(models.Model):
    """
    Represents additional information about the mode of transportation being used.
    See `OpenTrip_Core#Mode_Constructs <http://opentrip.info/wiki/OpenTrip_Core#Mode_Constructs>`_ for more info.
    """
    kind = models.CharField(max_length=255,choices=MODE_CHOICES,blank=False) # MUST
    capacity = models.PositiveIntegerField(blank=False) # OPT
    vacancy = models.PositiveIntegerField(blank=False) # OPT
    make = models.CharField(max_length=255,blank=True) # OPT
    model = models.CharField(max_length=255,blank=True) # OPT
    year = models.PositiveIntegerField(blank=True) # OPT
    color = models.CharField(max_length=255,blank=True) # OPT
    lic = models.CharField(max_length=255,blank=True) # OPT
    cost = models.FloatField(blank=True,null=True) # OPT
    
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


class Trip(models.Model):
    """
    Represents a Trip. 
    See `OpenTrip_Core#Entry_Elements <http://opentrip.info/wiki/OpenTrip_Core#Entry_Elements>`_ for more info.
    atom:id, atom:title, atom:link are not present in the models of DyCapo. They should be returned
    in case of an export of a Trip in OpenTrip Feed format.
    """
    published = models.DateTimeField(auto_now_add=True, blank=False) # MUST
    updated = models.DateTimeField(auto_now=True, blank=False) # MUST
    expires = models.DateTimeField(blank=False) # MUST
    content = models.TextField(blank=False) # MUST
    active = models.BooleanField(default=False) # MUST
    author = models.ForeignKey(Person,related_name='author', blank=False) # OPT
    locations = models.ManyToManyField(Location, blank=False) # MUST
    mode = models.ForeignKey(Mode, blank=False) # MUST
    prefs = models.ForeignKey(Prefs) # OPT
    participation = models.ManyToManyField(Person,through='Participation',related_name='participation') # EXT
    
    def to_xmlrpc(self):
        """
        Prepares the dictionary to be returned when riders search a ride.
        TODO:
        -use OpenTrip id, not Django internal id
        -choose what will be marshalled for Mode and Prefs objects
        -use django serializers instead of this
        -what else about the driver?
        """
        locations = self.locations.all()
        points = []
        for location in locations:
            points.append(location.georss_point)
        trip_dict = {
            'id' : self.get_atom_id_from_dycapo_id(),
            'published' : self.published,
            'updated': self.updated,
            'expires': self.expires,
            'content': self.content,
            'author': self.author.username,
            'mode': 'mode',
            'prefs': 'prefs',
            'locations':points,
        }
        return trip_dict
    
    def get_atom_id_from_dycapo_id(self):
        return "urn:guid:"+SITE_DOMAIN+":"+str(self.id)
    
    def get_dycapo_id_from_atom_id(self,atom_id):
        splitted_atom_id = atom_id.split(':')
        dycapo_id = int(splitted_atom_id[-1])
        return dycapo_id

class Participation(models.Model):
    """
    Describes the participation of a Person in a Trip.
    This is an OpenTrip extension and should be considered as a proposal for OpenTrip Dynamic.
    TODO: 
    - add bool related to the request of Participation of a rider to a Trip
    - add datetime related to request of Participation
    - add datetime related to start of Participation
    - add datetime related to finishing a Participation
    """
    person = models.ForeignKey(Person, related_name="participant") # used internally
    trip = models.ForeignKey(Trip, related_name="trip") # used internally
    role = models.CharField(max_length=6,choices=ROLE_CHOICES,blank=False) # EXT
    started = models.BooleanField(blank=False, default=False) # EXT
    finished = models.BooleanField(blank=False, default=False) # EXT    
    
    def save(self, force_insert=False, force_update=False):
        """
        Ensures integrity.
        """
        try:
            participation = Participation.objects.get(trip=self.trip,person=self.person)
            if participation:
                raise IntegrityError("This person already participates in this Trip!")
        except Participation.DoesNotExist:
            """
            A person can participate in a Trip only once
            """
            super(Participation, self).save(force_insert, force_update) # Call the "real" save() method.
    
    
class LocationManager(models.Manager):
    """
    For using http://docs.djangoproject.com/en/dev/topics/serialization/ to serialize a Location. TODO.
    """
    def get_by_natural_key(self, georss_point):
        return self.get(georss_point=georss_point)
