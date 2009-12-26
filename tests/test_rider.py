import test_classes
import random
class RiderTest():
    source = test_classes.Location()
    destination = test_classes.Location()
    client = ''
    
    def __init__(self,username,password):
        self.client = test_classes.get_client(username,password)
        points = [1.00,2.00,3.00]
        point_lat = random.choice(points)
        point_lon = random.choice(points)
        self.source.georss_point=str(point_lat) + "," + str(point_lon)
        self.source.label="home"
        self.source.point="orig"
        self.source.leaves = test_classes.now()

        point_lat = random.choice(points)
        point_lon = random.choice(points)
        self.destination.georss_point=str(point_lat) + "," + str(point_lon)
        self.destination.label="office"
        self.destination.point="dest"
        self.destination.leaves = test_classes.nowplusminutes(120)
        print "initializing random ride request from " + self.source.georss_point + " to " + self.destination.georss_point
        
    def search_ride(self):
        print "#" * 80
        print "SEARCHING FOR A RIDE..."
        print "#" * 80
        
        trip = self.client.dycapo.search_trip(self.source.__dict__,self.destination.__dict__)
        print trip
        print "#" * 80
        return trip
    
    def accept_trip(self,trip):
        print "#" * 80
        print "ACCEPTING A RIDE..."
        print "#" * 80
        
        trip = self.client.dycapo.accept_trip(trip)
        print trip
        print "#" * 80
        return trip