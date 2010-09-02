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
import piston.handler
import server.models
import rest.utils

class ApiHandler(piston.handler.BaseHandler):
    allowed_methods = ['GET']
    fields = ("persons",
        "trips",
        "searches"
        )
    
    def read(self, request):
        persons = {}
        persons['href'] = rest.utils.get_href(request,'person_handler',[])
        trips = {}
        trips['href'] = rest.utils.get_href(request,'trip_handler',[])
        searches = {}
        searches['href'] = rest.utils.get_href(request,'search_handler',[])
        api = {}
        api['persons'] = persons
        api['trips'] = trips
        api['searches'] = searches
        return api