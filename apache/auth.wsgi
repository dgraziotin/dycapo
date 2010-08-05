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

"""
Handles HTTP BASIC authorization on Dycapo. 
Credits: http://www.davidfischer.name/2009/10/django-authentication-and-mod_wsgi/
See docs/http.conf on how to use it
"""
import os
import sys
sys.stdout = sys.stderr
sys.path.append('/home/bodom_lx/Projects/')
sys.path.append('/home/bodom_lx/Projects/dycapo')

os.environ['DJANGO_SETTINGS_MODULE'] = 'dycapo.settings'

from django.contrib.auth.models import User
from django import db

def check_password(environ, user, password):
    """
    Authenticates apache/mod_wsgi against Django's auth database.
    """

    db.reset_queries() 

    kwargs = {'username': user, 'is_active': True} 

    try:
        # checks that the username is valid
        try:
            user = User.objects.get(**kwargs)
        except User.DoesNotExist:
            return None

        # verifies that the password is valid for the user
        if user.check_password(password):
            return True
        else:
            return False
    finally:
        db.connection.close()
