import django.db.models as models
import geopy.distance
import geopy.point
import settings
import copy

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
    See `OpenTrip_Core#Location_Constructs <http://opentrip.info/wiki/OpenTrip_Core#Location_Constructs>`_ for more info.
    """
    label = models.CharField(max_length=255, blank=True)
    street = models.CharField(max_length=255, blank=True)
    point = models.CharField(max_length=50, choices=WAYPOINT_CHOICES, blank=True)
    country = models.CharField(max_length=2, blank=True)
    region = models.CharField(max_length=255, blank=True)
    town = models.CharField(max_length=255, blank=True)
    postcode = models.PositiveIntegerField(blank=True, null=True, default=0)
    subregion = models.CharField(max_length=255, blank=True)
    georss_point = models.CharField(max_length=255, blank=True)
    """
    georss_pont_latitude and georss_point_longitude should be just used internally
    """
    georss_point_latitude = models.FloatField(null=True, default=0)
    georss_point_longitude = models.FloatField(null=True, default=0)
    """
    The following should be members of a separate Date-Time class but are included here for simplicity
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
    
    def address_to_point(self):
        """
        Given Geolocation information, it retrieves GeoRSS.
        the return value of geocoder.geocode is in the form
        (u'Street name, Street Number, Postcode City Province, Country', (latitude, longitude))
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
            raise ValueError('Could not retrieve Address information with the given GeoRSS point')
        self.georss_point_latitude = point.latitude
        self.georss_point_longitude = point.longitude
        
    def point_to_address(self):
        """
        Given GeoRSS point, it retrieves GeoLocation information in form of String
        the return value of geocoder.reverse is in the form
        (u'Street name, Street Number, Postcode City Province, Country', (latitude, longitude))
        """
        point = geopy.point.Point.from_string(self.georss_point)
        try:
            geocoder = geocoders.Google(settings.GOOGLE_MAPS_API_KEY)
            geocoding_result = geocoder.reverse((point.latitude, point.longitude))
            full_address = geocoding_result[0].split(",")
            self.street = full_address[0] + ',' + full_address[1]
            self.postcode = int(full_address[2].split(" ")[1])
            full_town = full_address[2].split(" ")[2:]
            self.town = " ".join(full_town) 
        except:
            self.town = ""
            self.street = ""
            self.postcode = 0       
            #raise ValueError('Could not retrieve GeoRSS point information with the given Address.')     
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
        if ((not self.street or not self.town or not self.postcode) and not self.georss_point):
            raise django.db.IntegrityError('Give either address details or georss_point')
        
        if not self.georss_point:
            """
            At this point we have Address details as string but not GeoRSS point.
            """
            self.address_to_point()
            super(Location, self).save(*args, ** kwargs) # Call the "real" save() method.
        else:
            """
            At this point we have a GeoRSS point but not Address details
            """
            self.point_to_address()
            super(Location, self).save(*args, ** kwargs) # Call the "real" save() method.
        
   
    def __unicode__(self):
        return self.georss_point
    
    def to_xmlrpc(self):
        """
        Returns a Python dict that contains just the attributes we want to expose
        in out XML-RPC methods
        """
        location_dict = copy.deepcopy(self.__dict__)
        del location_dict['georss_point_latitude']
        del location_dict['georss_point_longitude']
        del location_dict['id']
        return location_dict
    
    class Meta:
        app_label = 'server'