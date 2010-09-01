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

# Handle logging for this project
import logging
logging.basicConfig(
    level = logging.DEBUG,
    format = '%(asctime)s %(levelname)s %(message)s',
)

# These are all optional and set to their default values
RPC4DJANGO_LOG_REQUESTS_RESPONSES = True
RPC4DJANGO_RESTRICT_INTROSPECTION = False
RPC4DJANGO_RESTRICT_JSONRPC = True
RPC4DJANGO_RESTRICT_XMLRPC = False
RPC4DJANGO_RESTRICT_METHOD_SUMMARY = False
RPC4DJANGO_RESTRICT_RPCTEST = True
RPC4DJANGO_RESTRICT_REST = False

DEBUG = True
TEMPLATE_DEBUG = DEBUG

# NO ending slash!
DYCAPO_URL = 'http://127.0.0.1'

ADMINS = (
    # ('Your Name', 'your_email@domain.com'),
)

MANAGERS = ADMINS

DATABASE_ENGINE = 'mysql'           # 'postgresql_psycopg2', 'postgresql', 'mysql', 'sqlite3' or 'oracle'.
DATABASE_NAME = 'dycapo'             # Or path to database file if using sqlite3.
DATABASE_USER = 'root'             # Not used with sqlite3.
DATABASE_PASSWORD = ''         # Not used with sqlite3.
DATABASE_HOST = ''             # Set to empty string for localhost. Not used with sqlite3.
DATABASE_PORT = ''             # Set to empty string for default. Not used with sqlite3.

# Local time zone for this installation. Choices can be found here:
# http://en.wikipedia.org/wiki/List_of_tz_zones_by_name
# although not all choices may be available on all operating systems.
# If running in a Windows environment this must be set to the same as your
# system time zone.
TIME_ZONE = 'Europe/Rome'

# Language code for this installation. All choices can be found here:
# http://www.i18nguy.com/unicode/language-identifiers.html
LANGUAGE_CODE = 'en-us'

SITE_ID = 1
SITE_DOMAIN = 'dycapo.org'

# If you set this to False, Django will make some optimizations so as not
# to load the internationalization machinery.
USE_I18N = False

# Absolute path to the directory that holds media.
# Example: "/home/media/media.lawrence.com/"
MEDIA_ROOT = '/Users/bodom_lx/virtualenvs/django/dycapo/media/'

# URL that handles the media served from MEDIA_ROOT. Make sure to use a
# trailing slash if there is a path component (optional in other cases).
# Examples: "http://media.lawrence.com", "http://example.com/media/"
MEDIA_URL = '/media/'

# URL prefix for admin media -- CSS, JavaScript and images. Make sure to use a
# trailing slash.
# Examples: "http://foo.com/media/", "/media/".
ADMIN_MEDIA_PREFIX = '/media_admin/'

# Make this unique, and don't share it with anybody.
SECRET_KEY = 'blahblahblahblahsecretkey12345'

# List of callables that know how to import templates from various sources.
TEMPLATE_LOADERS = (
    'django.template.loaders.filesystem.load_template_source',
    'django.template.loaders.app_directories.load_template_source',
    #'django.template.loaders.eggs.load_template_source',
)

MIDDLEWARE_CLASSES = (
    'django.middleware.common.CommonMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',

    # Must be enabled for RPC4Django authenticated method calls
    'django.contrib.auth.middleware.AuthenticationMiddleware',

    # Required for RPC4Django authenticated method calls
    # Also requires Django 1.1+
    'django.contrib.auth.middleware.RemoteUserMiddleware',
)

# Required for RPC4Django authenticated method calls
# Also requires Django 1.1+
AUTHENTICATION_BACKENDS = (
    'dycapo.auth_backends.DycapoRemoteUserBackend',
    'piston.authentication.HttpBasicAuthentication',
    'django.contrib.auth.backends.RemoteUserBackend',
    'django.contrib.auth.backends.ModelBackend',
)



ROOT_URLCONF = 'dycapo.urls'

GOOGLE_MAPS_API_KEY = 'ABQIAAAAEA5TqsSgku8oY63GIt0kvxTpH3CbXHjuCVmaTc5MkkU4wO1RRhQOBSk1yb3j1mHbRPaRhtbSt_APcA'

TEMPLATE_DIRS = (
    # Put strings here, like "/home/html/django_templates" or "C:/www/django/templates".
    # Always use forward slashes, even on Windows.
    # Don't forget to use absolute paths, not relative paths.
)

TEMPLATE_DIRS = (
    # Put strings here, like "/home/html/django_templates" or "C:/www/django/templates".
    # Always use forward slashes, even on Windows.
    # Don't forget to use absolute paths, not relative paths.
    '/Users/bodom_lx/Projects/dycapo/templates',
)

INSTALLED_APPS = (
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.sites',
    'django.contrib.admin',
    'dycapo.piston',
    'dycapo.geopy',
    'dycapo.rpc4django',
    'dycapo.server',
    'dycapo.xmlrpc',
    'dycapo.rest'
)
