from rpc4django import rpcmethod
from django.contrib.auth.models import User
from models import Trip, Location, Person, Mode, Participation, Prefs

@rpcmethod(name='dycapo.add_trip', signature=['bool','Trip','Mode','Location','Location'], permission='auth.add_group')
def add_trip(trip, mode, source, destination):
        """ comments """
        dict_trip = trip
        dict_mode = mode
        dict_source= source
        dict_destination = destination
        
        driver = Person.objects.get(userid='driver1')
        
        source = Location()
        source = update(source,dict_source)
        source.save()
        
        destination = Location()
        destination = update(destination,dict_destination)
        destination.save()
        
        mode = Mode()
        mode = update(mode,dict_mode)
        mode.save()
        
        preferences = Prefs()
        preferences.age = "20"
        preferences.save()
        
        trip = Trip()
        trip = update(trip,dict_trip)
        trip.author = driver
        trip.mode = mode
        trip.prefs = preferences
        trip.save()
        trip.locations.add(source)
        trip.locations.add(destination)
        trip.save()
        

        participation = Participation()
        participation.person = driver
        participation.trip = trip
        participation.role = 'driver'
        participation.save()


def update(obj,dictionary):
        for key in dictionary:
                obj.__dict__[key] = dictionary[key]
        return obj
        

        