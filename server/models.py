from django.db import models
from django.contrib.auth.models import User

GENDER_CHOICES = (
        (u'M', u'Male'),
        (u'F', u'Female'),
    )


class Trait(models.Model):
    age = models.PositiveIntegerField()
    gender = models.CharField(max_length=1, choices=GENDER_CHOICES)
    smoker = models.BooleanField()
    blind = models.BooleanField()
    deaf = models.BooleanField()
    dog = models.BooleanField()

class Location(models.Model):
    label = models.CharField(max_length=255)
    street = models.CharField(max_length=255)
    point = models.CharField(max_length=50)
    country = models.CharField(max_length=2)
    region = models.CharField(max_length=255)
    town = models.CharField(max_length=255)
    postcode = models.PositiveIntegerField()
    subregion = models.CharField(max_length=255)
    intersection = models.CharField(max_length=255)
    address = models.CharField(max_length=255)
    georss_point = models.CharField(max_length=255)
    georss_radius = models.PositiveIntegerField()
    georss_box = models.CharField(max_length=255)
    offset = models.PositiveIntegerField()
    recurs = models.CharField(max_length=255)
    days = models.CharField(max_length=255)
    author = models.ForeignKey(User)
    leaves = models.DateTimeField()
    
class Person(models.Model):
    name = models.CharField(max_length=200)
    alias = models.CharField(max_length=200)
    userid = models.CharField(max_length=200)
    email = models.CharField(max_length=200)
    uri = models.CharField(max_length=200)
    phone = models.CharField(max_length=200)
    position = models.ForeignKey(Location)
    trait = models.ForeignKey(Trait)

    
class Mode(models.Model):
    kind = models.CharField(max_length=255)
    capacity = models.PositiveIntegerField()
    vacancy = models.PositiveIntegerField()
    make = models.CharField(max_length=255)
    model = models.CharField(max_length=255)
    year = models.PositiveIntegerField()
    color = models.CharField(max_length=255)
    lic = models.CharField(max_length=255)
    cost = models.FloatField()
    
class Prefs(models.Model):
    age = models.CharField(max_length=255)
    nonsmoking = models.BooleanField()
    gender = models.CharField(max_length=1, choices=GENDER_CHOICES)
    drive = models.BooleanField()
    ride = models.BooleanField()
    
class Trip(models.Model):
    published = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    expires = models.DateTimeField()
    content = models.TextField()
    active = models.BooleanField()
    author = models.ForeignKey(Person,related_name='author')
    locations = models.ManyToManyField(Location)
    mode = models.ForeignKey(Mode)
    prefs = models.ForeignKey(Prefs)
    participation = models.ManyToManyField(Person,through='Participation',related_name='participation')

class Participation(models.Model):
    role = models.CharField(max_length=255)
    started = models.BooleanField()
    finished = models.BooleanField()