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





