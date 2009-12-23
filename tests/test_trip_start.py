import datetime, time
from xmlrpclib import ServerProxy, DateTime
from test_classes import DycapoConnect, Location, Trip, Mode, now, nowplusdays, nowplusminutes

s = DycapoConnect("https://admin:password@127.0.0.1")

trip = Trip()
trip.id = 1

print "#" * 80
print "SENDING:" 
print "#" * 80
print "trip:\n"
print "\t" + str(trip.__dict__) + "\n"
print "#" * 80
print "\n\n"
print "#" * 80
print "RESULTS"
print "#" * 80
print s.client.dycapo.start_trip(trip.__dict__)
print "\n"
print "#" * 80





