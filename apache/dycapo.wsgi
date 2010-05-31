"""
See docs/http.conf on how to use it
"""
import os, sys
#Calculate the path based on the location of the WSGI script.
apache_configuration = os.path.dirname(__file__)

project = os.path.dirname(apache_configuration)
workspace = os.path.dirname(project)
sys.path.insert(0,'/home/bodomlx/webapps/dycapo_test/lib/python2.5')
sys.path.insert(0,'/home/bodomlx/webapps/dycapo_test/lib/python2.5/django')
sys.path.insert(0, workspace)
sys.path.insert(0,workspace+"/dycapo")

os.environ['DJANGO_SETTINGS_MODULE'] = 'dycapo.settings'

import django.core.handlers.wsgi
application = django.core.handlers.wsgi.WSGIHandler()
