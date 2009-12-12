from django.db import models
from django.contrib.auth.models import User
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
        (u'weekly', u'Origin'),
        (u'biweekly', u'Destination'),
        (u'monthly', u'Waypoint'),
)

ROLE_CHOICES = (
        (u'rider', u'Rider'),
        (u'driver', u'Driver'),
)

"""
Dycapo models
"""

class Location(models.Model):
    '''
    Represents a single location, as in http://opentrip.info/wiki/OpenTrip_Core#Location_Constructs
    '''
    label = models.CharField(max_length=255) # OPT
    street = models.CharField(max_length=255)
    point = models.CharField(max_length=50, choices=WAYPOINT_CHOICES) # OPT
    country = models.CharField(max_length=2) # OPT
    region = models.CharField(max_length=255) # OPT
    town = models.CharField(max_length=255) # OPT
    postcode = models.PositiveIntegerField() # OPT
    subregion = models.CharField(max_length=255) # OPT
    intersection = models.CharField(max_length=255) # OPT
    address = models.CharField(max_length=255) # OPT
    georss_point = models.CharField(max_length=255)  # RECOM
    georss_radius = models.PositiveIntegerField() # OPT
    georss_box = models.CharField(max_length=255) # OPT
    '''
    The following should be members of a separate Date-Time class but are included here for simplicity
    '''
    offset = models.PositiveIntegerField() # OPT
    recurs = models.CharField(max_length=255) # OPT
    days = models.CharField(max_length=255, choices=RECURS_CHOICES) # OPT
    leaves = models.DateTimeField() # MUST
    
class Person(models.Model):
    '''
    Represents a Person as described on http://opentrip.info/wiki/OpenTrip_Core#Person_Constructs
    '''
    name = models.CharField(max_length=200) # MUST
    alias = models.CharField(max_length=200) # OPT
    userid = models.CharField(max_length=200) # MUST
    email = models.CharField(max_length=200) # OPT
    uri = models.CharField(max_length=200) # OPT
    phone = models.CharField(max_length=200) # OPT
    position = models.ForeignKey(Location) # EXT
    age = models.PositiveIntegerField() # OPT
    gender = models.CharField(max_length=1, choices=GENDER_CHOICES) # OPT
    smoker = models.BooleanField() # OPT
    blind = models.BooleanField() # OPT
    deaf = models.BooleanField() # OPT
    dog = models.BooleanField() # OPT

    
class Mode(models.Model):
    '''
    Represents additional information about the mode of transportation being used.
    See http://opentrip.info/wiki/OpenTrip_Core#Mode_Constructs
    '''
    kind = models.CharField(max_length=255) # MUST
    capacity = models.PositiveIntegerField() # OPT
    vacancy = models.PositiveIntegerField() # OPT
    make = models.CharField(max_length=255) # OPT
    model = models.CharField(max_length=255) # OPT
    year = models.PositiveIntegerField() # OPT
    color = models.CharField(max_length=255) # OPT
    lic = models.CharField(max_length=255) # OPT
    cost = models.FloatField() # OPT
    
class Prefs(models.Model):
    '''
    Stores the preferences of a Trip set by the Person who creates it. 
    See http://opentrip.info/wiki/OpenTrip_Core#Preference_Constructs for more info. 
    We kept drive and ride attributes just for compatibility reasons: in OpenTrip Dynamic just a driver should be
    the author of a Trip.
    '''
    age = models.CharField(max_length=50,blank=True) # OPT
    nonsmoking = models.BooleanField(blank=True) # OPT
    gender = models.CharField(max_length=1, choices=GENDER_CHOICES,blank=True) # OPT
    drive = models.BooleanField() # OPT
    ride = models.BooleanField() # OPT


class Trip(models.Model):
    '''
    Represents a Trip. See http://opentrip.info/wiki/OpenTrip_Core#Entry_Elements for more info.
    atom:id, atom:title, atom:link are not present in the models of DyCapo. They should be returned
    in case of an export of a Trip in OpenTrip Feed format.
    '''
    published = models.DateTimeField(auto_now_add=True, blank=False) # MUST
    updated = models.DateTimeField(auto_now=True, blank=False) # MUST
    expires = models.DateTimeField(blank=False) # MUST
    content = models.TextField(blank=False) # MUST
    active = models.BooleanField(default=False) # MUST
    author = models.ForeignKey(Person,related_name='author', blank=False) # OPT
    locations = models.ManyToManyField(Location, blank=False) # MUST
    mode = models.ForeignKey(Mode, blank=False) # MUST
    prefs = models.ForeignKey(Prefs) # OPT
    participation = models.ManyToManyField(Person,through='Participation',related_name='participation', blank=False) # EXT

class Participation(models.Model):
    '''
    Describes the participation of a Person in a Trip.
    This is an OpenTrip extension and should be considered as a proposal for OpenTrip Dynamic
    '''
    person = models.ForeignKey(Person, related_name="participant") # used internally
    trip = models.ForeignKey(Trip, related_name="trip") # used internally
    role = models.CharField(max_length=6,choices=ROLE_CHOICES,blank=False) # EXT
    started = models.BooleanField(blank=False, default=False) # EXT
    finished = models.BooleanField(blank=False, default=False) # EXT    