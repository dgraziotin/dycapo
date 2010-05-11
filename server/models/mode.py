from django.db import models
import copy

MODE_CHOICES = (
    (u'auto', u'Auto'),
    (u'van', u'Van'),
    (u'bus', u'Bus'),
)

class Mode(models.Model):
    """
    Represents additional information about the mode of transportation being used.
    See `OpenTrip_Core#Mode_Constructs <http://opentrip.info/wiki/OpenTrip_Core#Mode_Constructs>`_ for more info.
    """
    kind = models.CharField(max_length=255, choices=MODE_CHOICES, blank=False)
    capacity = models.PositiveIntegerField(blank=False, null=True, default=0)
    vacancy = models.PositiveIntegerField(blank=False, null=True, default=0)
    make = models.CharField(max_length=255, blank=True)
    model = models.CharField(max_length=255, blank=True)
    year = models.PositiveIntegerField(blank=True, null=True, default=0)
    color = models.CharField(max_length=255, blank=True)
    lic = models.CharField(max_length=255, blank=True)
    cost = models.FloatField(blank=True, null=True, default=0)
    
    def save(self, * args, ** kwargs):
        """
        Ensures integrity
        """
        if not self.kind or not self.capacity or not self.vacancy or not self.make or not self.model or self.make == 'cacca':
            raise IntegrityError('Attributes kind, capacity, vacancy, make, model MUST be given.')
        super(Mode, self).save(*args, ** kwargs) # Call the "real" save() method.
        
    def to_xmlrpc(self):
        """
        Returns a Python dict that contains just the attributes we want to expose
        in out XML-RPC methods
        """
        mode_dict = copy.deepcopy(self.__dict__)
        del mode_dict['id']
        return mode_dict
    
    class Meta:
        app_label = 'server'
