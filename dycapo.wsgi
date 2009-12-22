"""
See docs/http.conf on how to use it
"""
import os
import sys
sys.path.append('/home/bodom_lx/Projects/')
sys.path.append('/home/bodom_lx/Projects/dycapo')
os.environ['DJANGO_SETTINGS_MODULE'] = 'dycapo.settings'

import django.core.handlers.wsgi
application = django.core.handlers.wsgi.WSGIHandler()

