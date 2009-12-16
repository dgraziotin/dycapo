"""
This will give us the opportunity to use Person instead of Django's User.
It works using manage.py shell but needs verifications for use with RPC4Django,
HTTPS and HTTP authentication
"""

"""
auth_backends.py
Created by Joel Bremson on 2009-09-07.
joel3000 @t gmail
http://steps.ucdavis.edu/People/jbremson/extending-the-user-model-in-djang
"""
"""
from django.conf import settings
from django.contrib.auth.backends import ModelBackend
from django.contrib.auth.middleware import RemoteUserMiddleware
from django.core.exceptions import ImproperlyConfigured
from django.db.models import get_model
from django.contrib.auth.models import User
import pdb


class AutopiaUserModelBackend(ModelBackend, RemoteUserMiddleware):
	def authenticate(self, username=None, password=None):
		try:
			self._user_id=User.objects.get(username=username).id
			user = self.user_class.objects.get(username=username)
			if user.check_password(password):
				return user
		except self.user_class.DoesNotExist:
			return None


	def get_user(self, user_id):
		try:
			self._user_id = user_id
			return self.user_class.objects.get(pk=user_id)
		except self.user_class.DoesNotExist:
			return None

	@property
	def user_class(self):
		if not hasattr(self, '_user_class'):
			try: # group is used only for subclass info - only one entry allowed (className)
				# for the user group
				group = User.objects.get(id=self._user_id).groups.values()[0]['name']
			except IndexError:
				# user is a regular user
				self._user_class = get_model("auth","user")
			else:
				self._user_class = get_model("mpg",group)
			if not self._user_class:
				raise ImproperlyConfigured('Could not get custom user model')
		return self._user_class
"""
