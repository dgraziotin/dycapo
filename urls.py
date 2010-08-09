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
from django.conf.urls.defaults import *
# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Example:
    # (r'^dycapo/', include('dycapo.foo.urls')),

    # Uncomment the admin/doc line below and add 'django.contrib.admindocs'
    # to INSTALLED_APPS to enable admin documentation:
    # (r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    (r'^admin/', include(admin.site.urls)),
    (r'^RPC2$', 'dycapo.rpc4django.views.serve_rpc_request'),
    (r'^api/', include('dycapo.api.urls')),
    (r'^media_admin/(?P<path>.*)$', 'django.views.static.serve',
        {'document_root': '/home/bodom_lx/Projects/dycapo/media_admin/', 'show_indexes': True}),
    (r'^media/(.*)', 'django.views.static.serve', {'document_root': '/home/bodom_lx/Projects/dycapo/media/'}),
    (r'^$', 'django.views.generic.simple.direct_to_template', {'template': 'home.html'}),
)
