#!/bin/bash
git pull origin main &&

# SOLR: search engine customization
cp /usr/lib/ckan/default/src/ckanext-msl-ckan/ckanext/msl_ckan/config/schema.xml /usr/lib/ckan/default/src/ckan/ckan/config/solr/schema.xml &&

# uu-ckan-theme: compile css styles
lessc ckanext/uu-ckan-theme/less/main.less ckanext/uu-ckan-theme/fanstatic/uu-ckan-custom.css &&

# restart everything CKAN & SOLR
systemctl restart tomcat9 &&
supervisorctl reload && 
service nginx restart