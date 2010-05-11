from django.db import models
import copy

GENDER_CHOICES = (
    (u'M', u'Male'),
    (u'F', u'Female'),
)

class Prefs(models.Model):
    """
    Stores the preferences of a Trip set by the Person who creates it. 
    See `OpenTrip_Core#Preference_Constructs <http://opentrip.info/wiki/OpenTrip_Core#Preference_Constructs>`_ for more info.
    We kept drive and ride attributes just for compatibility reasons: in OpenTrip Dynamic just a driver should be
    the author of a Trip.
    """
    age = models.CharField(max_length=50, blank=True)
    nonsmoking = models.BooleanField(blank=True)
    gender = models.CharField(max_length=1, choices=GENDER_CHOICES, blank=True)
    drive = models.BooleanField(default=False)
    ride = models.BooleanField(default=False)
   
    def to_xmlrpc(self):
        """
        Prepares the dictionary to be returned when returned as XML-RPC
        """
        prefs_dict = copy.deepcopy(self.__dict__)
        del prefs_dict['id']
        return prefs_dict
    
    class Meta:
        app_label = 'server'