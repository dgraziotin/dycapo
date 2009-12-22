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
    (r'^media_admin/(?P<path>.*)$', 'django.views.static.serve',
        {'document_root': '/home/bodom_lx/Projects/dycapo/media_admin/', 'show_indexes': True}),
    
)
