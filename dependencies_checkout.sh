#!/bin/bash
rm -rf rpc4django
rm -rf geopy
svn export --username=rpc4django --password=rpc4django https://svn.davidfischer.name/rpc4django/trunk/rpc4django rpc4django
svn export http://geopy.googlecode.com/svn/branches/reverse-geocode/geopy geopy