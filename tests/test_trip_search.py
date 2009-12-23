import datetime, time
from xmlrpclib import ServerProxy, DateTime
from test_classes import DycapoConnect, Location, Trip, Mode, now, nowplusdays, nowplusminutes

s = DycapoConnect("https://admin:password@127.0.0.1")

source = Location()
source.georss_point="1.00,1.00"
source.label="home"
source.point="orig"
source.leaves = now()


destination = Location()
destination.georss_point="2.00,2.00"
destination.label="office"
destination.point="dest"
destination.leaves = nowplusminutes(120)

print "#" * 80
print "SENDING:" 
print "#" * 80
print "source:\n"
print "\t" + str(source.__dict__) + "\n"
print "destination:\n"
print "\t" + str(destination.__dict__) + "\n"
print "#" * 80
print "\n\n"
print "#" * 80
print "RESULTS"
print "#" * 80
print s.client.dycapo.search_trip(source.__dict__,destination.__dict__)
print "\n"
print "#" * 80





