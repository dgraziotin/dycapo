from django.db import models
from django.contrib.auth.models import User
# Create your models here.


class Author(models.Model):
    name = models.CharField(max_length=200)
    surname = models.CharField(max_length=200)
    age = models.IntegerField()
    


class Book(models.Model):
    title = models.CharField(max_length=200)
    num_pages = models.IntegerField()
    author = models.ForeignKey(Author)

class Location(models.Model):
    label = models.CharField(max_length=255)
    street = models.CharField(max_length=500)
    point_x = models.FloatField()
    point_y = models.FloatField()
    author = models.ForeignKey(User)
    unique_together = ("label", "author", "street")
    
class Trip(models.Model):
    started = models.BooleanField(default=False)
    finished = models.BooleanField(default=False)
    locations = models.ManyToManyField(Location)
    driver = models.ForeignKey(User,related_name="driver")
    riders = models.ManyToManyField(User,related_name="riders")
    
