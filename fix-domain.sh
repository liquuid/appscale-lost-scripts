#!/bin/bash
#
# Fixes AppScale domain related files so we can open the web console as https://1443.mydomain.com, instead of https://mydomain.com:1443.
# 

# Stop execution on error
set -e

#
# AppScale files
#

APPSCALE_HOME=/var/lib/appscale

# mydomain.com:1443 => 1443.mydomain.com
sed -i 's/{0}:{1}/{1}.{0}/g' $APPSCALE_HOME/AppDashboard/lib/app_dashboard_data.py

#
# nginx
#

NGINX_HOME=/etc/nginx
DOMAIN=$1
DIR=`dirname $0`

cat $NGINX_HOME/mykey.pem /etc/nginx/mycert.pem > $NGINX_HOME/ssl.pem

cp $DIR/nginx-default $NGINX_HOME/sites-enabled/default

sed -i "s/_domain_/$DOMAIN/g" $NGINX_HOME/sites-enabled/default

# "service nginx restart" fails sometimes
/etc/init.d/nginx stop
/etc/init.d/nginx start