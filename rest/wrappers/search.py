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
import piston.utils
import server.models
import server.utils
import server.common
import rest.utils

class SearchHandler(piston.handler.BaseHandler):
    allowed_methods = ['GET','POST']
    model = server.models.Search
    fields = ("href","origin","destination",("author",("fake","username","href")),("trips",('href', 'published', 'updated', 'expires', 
              ('author',('username','gender','href')), 
              'locations',
              'modality',
              'preferences',
              'participations')))

    def read(self, request, id=None):
        user = rest.utils.get_rest_user(request)
        if not id:
            return piston.utils.rc.NOT_FOUND
        try:
            search = server.models.Search.objects.get(id=id)
            result = server.passenger.searchRide(search.origin, search.destination, user)
            if result.type == "Trip[]":
                search.trips = result.value
                return search
            else:
                return piston.utils.rc.NOT_FOUND
        except server.models.Search.DoesNotExist:
            return piston.utils.rc.NOT_FOUND
        
    def create(self, request):
        user = rest.utils.get_rest_user(request)
        data = request.data
        
        origin = server.models.Location()
        dict_orig = rest.utils.clean_ids(data['origin'])
        origin = rest.utils.populate_object_from_dictionary(origin, dict_orig)
        origin.save()
        
        destination = server.models.Location()
        dict_dest = rest.utils.clean_ids(data['destination'])
        destination = rest.utils.populate_object_from_dictionary(destination, dict_dest)
        destination.save()
        
        search = server.models.Search()
        search.origin = origin
        search.destination = destination
        search.author = user
        
        search.save()
        search.href = rest.utils.get_href(request, 'search_handler', [search.id])
        search.save()
        
        origin.href = rest.utils.get_href(request, 'search_handler', [search.id])
        destination.href = rest.utils.get_href(request, 'search_handler', [search.id])
        origin.save()
        destination.save()

        
        return search 
       
            