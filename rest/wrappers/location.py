from piston.handler import BaseHandler
import server.models

class LocationHandler(BaseHandler):
    #allowed_methods = ['GET','POST','PUT']
    model = server.models.Location
    exclude = ('_state','id',
               'georss_point_longitude','georss_point_latitude')