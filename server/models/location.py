"""
   Copyright 2010 Daniel Graziotin <daniel.graziotin@acm.org>

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
"""

"""This module holds the Location model"""

import django.db.models as models
import geopy.distance
import geopy.point
import geopy.geocoders
import settings
import copy
import datetime
import django.core.exceptions
import django.db

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
                             blank=True, db_index=True)
    country = models.CharField(max_length=2, blank=True)
    region = models.CharField(max_length=255, blank=True)
    town = models.CharField(max_length=255, blank=True)
    postcode = models.PositiveIntegerField(blank=True, null=True, default=0)
    subregion = models.CharField(max_length=255, blank=True)
    georss_point = models.CharField(max_length=255, blank=True, db_index=True)
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
        """
        A Factory method. Given a Geopy Point object, it creates
        and returns the corresponding Dycapo Location object.
        """
        location = Location()
        location.georss_point = str(point.latitude) + " " + str(point.longitude)
        location.point = 'posi'
        location.leaves = datetime.datetime.now()
        location.point_to_address()
        return location

    def get_box_around(self, diagonal_meters=None):
        """
        Creates a GeoRSS box around the current Location, with diagonal given in
        meters. The box is returned as a Python list, in this order:
        0) top left corner
        1) top right corner
        2) bottom right corner
        3) bottom left corner
        """
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
        elif not self.town or not self.street:
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
            geocoder = geopy.geocoders.Google(settings.GOOGLE_MAPS_API_KEY)
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
            geocoder = geopy.geocoders.Google(settings.GOOGLE_MAPS_API_KEY)
            geocoding_result = geocoder.reverse(
                                            (point.latitude,point.longitude) )

            full_address = geocoding_result[0].split(",")
            #if type(full_address).__name__ == 'bool':
            #    self.georss_point_latitude = point.latitude
            #    self.georss_point_longitude = point.longitude
            #    return
            if len(full_address)==4:
                self.street = full_address[0] + ',' + full_address[1]
                self.postcode = int(full_address[2].split(" ")[1])
                full_town = full_address[2].split(" ")[2:]
                self.town = " ".join(full_town)
                #self.country = full_address[-1].split(" ")[1]
            elif len(full_address)==3:
                self.street = full_address[0]
                self.postcode = int(full_address[1].split(" ")[1])
                full_town = full_address[1].split(" ")[2:]
                self.town = " ".join(full_town)
                #self.country = full_address[-1].split(" ")[1]
            else:
                self.town = full_address[0]
        except Exception, e:
            self.town = "UNKNOWN"
            self.street = "UNKNOWN"
            self.postcode = 0
        self.georss_point_latitude = point.latitude
        self.georss_point_longitude = point.longitude


    def clean(self):
        """
        Ensures integrity
        """
        if not self.point:
            raise django.core.exceptions.ValidationError('Attribute point must be given.')
        if not self.leaves:
            raise django.core.exceptions.ValidationError('Attribute leaves must be given.')
        if (    (not self.street or not self.town or not self.postcode)
                and not self.georss_point):
            raise django.core.exceptions.ValidationError('Give either address details or georss_point')

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
        del location_dict['_state']
        location_dict['leaves'] = self.leaves.isoformat(' ')
        return location_dict

    class Meta:
        app_label = 'server'
