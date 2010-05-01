import utils
class Location():
    def __init__(self,point='posi',georss_point='',label='Work',postcode=0,leaves=utils.now()):
        self.point = point
        self.georss_point = georss_point
        self.offset = 30
        self.label = label
        self.postcode = postcode
        self.leaves = leaves

class Trip():
    def __init__(self,expires=utils.now):
        self.expires = expires


class Mode():
    def __init__(self,kind='auto',capacity=4,lic='',color='',make='Ford',vacancy=3,cost=0,model='Fiesta'):
        self.kind = kind
        self.capacity = capacity
        self.lic = lic
        self.color = color
        self.make = make
        self.vacancy = vacancy
        self.cost = cost
        self.model = model
    
class Prefs():
    def __init__(self,age='18-30',nonsmoking=False):
        self.age = age
        self.nonsmoking = nonsmoking
    
class Response(object):
    """
    This is an envelope that standardizes the response of Dycapo. This is an OpenTrip Dynamic proposal.
    """
    def __init__(self,code=-1,message="",type="",value=None):
        self.code = code
        self.message = message
        self.type = type
        self.value = value
        
class Person():
    def __init__(self,username,password,domain,position=Location(),destination=Location(),clean_responses=True):
        self.clean_responses = clean_responses
        self.position = position
        self.destination = destination
        self.username = username
        self.client = utils.get_xmlrpc_client(username,password, domain)
        self.trip = None
    
    def update_position(self,location=None):
        print "#" * 80
        print self.username + ": UPDATING POSITION..."
        print "#" * 80
        if location: self.position = location
        response = self.client.dycapo.update_position(self.position)
        print "Dycapo Response: \n" + str(response)
        print "#" * 80
        return utils.extract_response(response)
    
    def get_position(self,username=None):
        print "#" * 80
        print self.username + ": GETTING POSITION..."
        print "#" * 80
        if not username: username = self.username
        person = {'username':username}
        response = self.client.dycapo.get_position(person)
        print "Dycapo Response: \n" + str(response)
        print "#" * 80
        return utils.extract_response(response)
    
    def delete_trip(self):
        print "#" * 80
        print "DELETING TRIP..."
        print "#" * 80
        response = self.client.dycapo.delete_trip(self.trip)
        print "#" * 80
        return utils.extract_response(response)

class Driver(Person):
    def insert_trip(self):
        source = Location(georss_point=self.position.georss_point,point='orig')
        destination = self.destination
        mode = Mode()
        prefs = Prefs()
        trip = Trip()
        trip.expires = utils.nowplusdays(3)
        print "initializing Trip from " + self.position.georss_point + " to " + self.destination.georss_point
        print "#" * 80
        print self.username + ": SAVING TRIP..."
        print "#" * 80
        response = self.client.dycapo.add_trip(trip.__dict__,mode.__dict__,prefs.__dict__,source.__dict__,destination.__dict__)
        print "Dycapo Response: \n" + str(response)
        print "#" * 80
        self.trip = utils.extract_response(response)
        
    def start_trip(self):
        print "#" * 80
        print self.username + ": STARTING TRIP..."
        print "#" * 80
        response = self.client.dycapo.start_trip(self.trip)
        print response
        print "#" * 80
        return utils.extract_response(response)
    
    def check_ride_requests(self):
        print "#" * 80
        print self.username + ": SEARCHING FOR RIDERS..."
        print "#" * 80
        response = self.client.dycapo.check_ride_request(self.trip)
        print "Dycapo Response: \n" + str(response)
        print "#" * 80
        return utils.extract_response(response)
    
    def accept_ride_request(self,person):
        print "#" * 80
        print self.username + ": ACCEPTING A RIDE REQUEST..."
        print "#" * 80
        response = self.client.dycapo.accept_ride_request(self.trip,person)
        print "Dycapo Response: \n" + str(response)
        print "#" * 80
        return utils.extract_response(response)
    
class Rider(Person):
    def search_ride(self):
        print "*" * 80
        print self.username + ": SEARCHING FOR A RIDE from " + source.georss_point + " to " + destination.georss_point
        print "*" * 80
        response = self.client.dycapo.search_trip(self.position.__dict__,self.destination.__dict__)
        print "Dycapo Response: \n" + str(response)
        print "*" * 80
        return utils.extract_response(response)
    
    def request_ride(self,trip):
        print "*" * 80
        print self.username + ": REQUESTING A RIDE..."
        print "*" * 80
        response = self.client.dycapo.request_ride(trip)
        print "Dycapo Response: \n" + str(response)
        return utils.extract_response(response)
  

