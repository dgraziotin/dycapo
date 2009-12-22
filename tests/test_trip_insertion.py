import datetime, time
from xmlrpclib import ServerProxy, DateTime
from test_classes import DycapoConnect, Location, Trip, Mode, now, nowplusdays, nowplusminutes

s = DycapoConnect("https://admin:password@127.0.0.1")

source = Location()
source.georss_point="1,1"
source.label="home"
source.point="orig"
source.leaves = now()


destination = Location()
destination.georss_point="2,2"
destination.label="office"
destination.point="dest"
destination.leaves = nowplusminutes(120)

mode = Mode()
mode.capacity = 3
mode.vacancy = 3
mode.color = 'blue'
mode.cost = 0
mode.lic = '1234f434'
mode.make = 'ford'
mode.model = 'fiesta'
mode.year = 2003
mode.kind = 'auto'

trip = Trip()
trip.content = 'description of the trip'
trip.expires = nowplusdays(3)

print "#" * 80
print "SENDING:" 
print "#" * 80
print "source:\n"
print "\t" + str(source.__dict__) + "\n"
print "destination:\n"
print "\t" + str(destination.__dict__) + "\n"
print "mode:\n"
print "\t" + str(mode.__dict__) + "\n"
print "trip:\n"
print "\t" + str(trip.__dict__) + "\n"
print "#" * 80
print "\n\n"
print "#" * 80
print "RESULTS"
print "#" * 80
print s.client.dycapo.add_trip(trip.__dict__,mode.__dict__,source.__dict__,destination.__dict__)
print "\n"
print "#" * 80





