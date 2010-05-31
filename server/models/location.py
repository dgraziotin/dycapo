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

"""This module holds the Location model"""

import django.db.models as models
import geopy.distance
import geopy.point
import settings
import copy
import datetime

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

class Location(models.Model):
    """
    Represents a single location.
    See `OpenTrip_Core#Location_Constructs
    <http://opentrip.info/wiki/OpenTrip_Core#Location_Constructs>`_
    for more info.
    """
    label = models.CharField(max_length=255, blank=True)
    street = models.CharField(max_length=255, blank=True)
    point = models.CharField(max_length=50, choices=WAYPOINT_CHOICES,
                             blank=True)
    country = models.CharField(max_length=2, blank=True)
    region = models.CharField(max_length=255, blank=True)
    town = models.CharField(max_length=255, blank=True)
    postcode = models.PositiveIntegerField(blank=True, null=True, default=0)
    subregion = models.CharField(max_length=255, blank=True)
    georss_point = models.CharField(max_length=255, blank=True)
    """
    georss_pont_latitude and georss_point_longitude
    should be just used internally
    """
    georss_point_latitude = models.FloatField(null=True, default=0)
    georss_point_longitude = models.FloatField(null=True, default=0)
    """
    The following should be members of a separate Date-Time class but are
    included here for simplicity
    """
    offset = models.PositiveIntegerField(blank=True, null=True, default=0)
    recurs = models.CharField(max_length=255, blank=True)
    days = models.CharField(max_length=255, choices=RECURS_CHOICES, blank=True)
    leaves = models.DateTimeField(blank=True, null=True)

    def distance(self, location):
        """
        Returns the distance in KMs from this location to a given location
        """
        current_point = geopy.point.Point(self.georss_point)
        location_point = geopy.point.Point(location.georss_point)
        distance = geopy.distance.distance(current_point, location_point)
        return distance.kilometers

    def get_location_from_geopy_point(self, point):
        location = Location()
        location.georss_point = str(point.latitude) + " " + str(point.longitude)
        location.point = 'posi'
        location.leaves = datetime.datetime.now()
        location.point_to_address()
        return location

    def get_box_around(self, diagonal_meters=None):
        if not diagonal_meters:
            diagonal_meters = self.offset

        diagonal_kmeters = diagonal_meters / 1000.0
        destination = geopy.distance.GreatCircleDistance().destination
        box_around = [self.get_location_from_geopy_point(
                            destination(self.georss_point,40,diagonal_kmeters)),
                      self.get_location_from_geopy_point(
                            destination(self.georss_point,135,diagonal_kmeters)),
                      self.get_location_from_geopy_point(
                        destination(self.georss_point,225,diagonal_kmeters)),
                      self.get_location_from_geopy_point(
                      destination(self.georss_point,315,diagonal_kmeters))]
        return box_around

    def complete_fields(self):
        """
        This method looks for missing fields and tries to complete them also by
        calling methods using (reverse) geocoding methods
        """
        if not self.offset or self.offset < 149:
            self.offset = 150
        if not self.georss_point:
            """
            At this point we have Address details as string but not GeoRSS point.
            """
            self.address_to_point()
        else:
            """
            At this point we have a GeoRSS point but not Address details
            """
            self.point_to_address()


    def address_to_point(self):
        """
        Given Geolocation information, it retrieves GeoRSS.
        the return value of geocoder.geocode is in the form
        (u'Street name, Street Number, Postcode City Province, Country',
            (latitude, longitude))
        """
        try:
            geocoder = geocoders.Google(settings.GOOGLE_MAPS_API_KEY)
            address = self.street + ", " + str(self.postcode) + " " + self.town
            geo_info = geocoder.geocode(address)
            self.georss_point = str(geo_info[1][0]) + ' ' + str(geo_info[1][1])
            point = geopy.point.Point.from_string(self.georss_point)
            self.georss_point_latitude = point.latitude
            self.georss_point_longitude = point.longitude
        except:
            self.georss_point = "0 0"
            self.georss_point_latitude = 0
            self.georss_point_longitude = 0
            raise ValueError("Could not retrieve Address information with the given GeoRSS point")
        self.georss_point_latitude = point.latitude
        self.georss_point_longitude = point.longitude

    def point_to_address(self):
        """
        Given GeoRSS point, it retrieves GeoLocation information
        in form of String
        the return value of geocoder.reverse is in the form
        (u'Street name, Street Number, Postcode City Province, Country',
        (latitude, longitude))
        """
        point = geopy.point.Point.from_string(self.georss_point)
        try:
            geocoder = geocoders.Google(settings.GOOGLE_MAPS_API_KEY)
            geocoding_result = geocoder.reverse(
                                            (point.latitude,point.longitude) )
            full_address = geocoding_result[0].split(",")
            self.street = full_address[0] + ',' + full_address[1]
            self.postcode = int(full_address[2].split(" ")[1])
            full_town = full_address[2].split(" ")[2:]
            self.town = " ".join(full_town)
        except:
            self.town = ""
            self.street = ""
            self.postcode = 0
        self.georss_point_latitude = point.latitude
        self.georss_point_longitude = point.longitude


    def save(self, * args, ** kwargs):
        """
        Ensures integrity
        """
        if not self.point:
            raise django.db.IntegrityError('Attribute point must be given.')
        if not self.leaves:
            raise django.db.IntegrityError('Attribute leaves must be given.')
        if (    (not self.street or not self.town or not self.postcode)
                and not self.georss_point):
            raise django.db.IntegrityError('Give either address details or georss_point')
        self.complete_fields()
        super(Location, self).save(*args, ** kwargs)


    def __unicode__(self):
        return self.georss_point

    def to_xmlrpc(self):
        """
        Returns a Python dict that contains just the attributes
        we want to expose in out XML-RPC methods
        """
        location_dict = copy.deepcopy(self.__dict__)
        del location_dict['georss_point_latitude']
        del location_dict['georss_point_longitude']
        del location_dict['id']
        return location_dict

    class Meta:
        app_label = 'server'
