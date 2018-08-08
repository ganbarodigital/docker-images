#!/bin/bash

# defaults that may be set in Dockerfile
#
# why do we have two sets?
# - NGINX_DEFAULT_* are for setting in Dockerfiles
# - when I've attempted to override them in docker-compose.yml. that
#   hasn't worked
NGINX_DEFAULT_SITE_ROOT=${NGINX_DEFAULT_SITE_ROOT:-/workspace/www}
NGINX_DEFAULT_APP_SITE_CONF=${NGINX_DEFAULT_APP_SITE_CONF:-static-site.conf}
NGINX_DEFAULT_APP_SERVER_CONF=${NGINX_DEFAULT_APP_SERVER_CONF:-empty.conf}

# the variables we will be substituting
NGINX_SITE_ROOT=${NGINX_SITE_ROOT:-${NGINX_DEFAULT_SITE_ROOT}}
NGINX_APP_SITE_CONF=${NGINX_APP_SITE_CONF:-${NGINX_DEFAULT_APP_SITE_CONF}}
NGINX_APP_SERVER_CONF=${NGINX_APP_SERVER_CONF:-${NGINX_DEFAULT_APP_SERVER_CONF}}

# we assume a 'modern' app structure where most of the code lives outside
# the app's SITE_ROOT for security purposes
NGINX_APP_ROOT=${NGINX_APP_ROOT:-$(dirname ${NGINX_SITE_ROOT})}

# tell the user what settings we are using
echo "Nginx: ___DEFAULT_ROOT___ is ${NGINX_SITE_ROOT}"
echo "Nginx: ___APP_SITE_CONF___ is ${NGINX_APP_SITE_CONF}"
echo "Nginx: ___APP_SERVER_CONF___ is ${NGINX_APP_SERVER_CONF}"
echo "Nginx: ___APP_ROOT___ is ${NGINX_APP_ROOT}"

# the NGINX files we will edit
NGINX_FILES=$(find /etc/nginx -type f)

# let's edit them
for x in $NGINX_FILES ; do
    sed -i "s|___DEFAULT_ROOT___|${NGINX_SITE_ROOT}|g" $x
    sed -i "s|___APP_SITE_CONF___|${NGINX_APP_SITE_CONF}|g" $x
    sed -i "s|___APP_SERVER_CONF___|${NGINX_APP_SERVER_CONF}|g" $x
    sed -i "s|___APP_ROOT___|${NGINX_APP_ROOT}|g" $x
done

# the Supervisord files we will edit
SUPERVISORD_FILES=$(find /etc/supervisor -type f)

# let's edit them
for x in $SUPERVISORD_FILES ; do
    sed -i "s|___DEFAULT_ROOT___|${NGINX_SITE_ROOT}|g" $x
    sed -i "s|___APP_SITE_CONF___|${NGINX_APP_SITE_CONF}|g" $x
    sed -i "s|___APP_SERVER_CONF___|${NGINX_APP_SERVER_CONF}|g" $x
    sed -i "s|___APP_ROOT___|${NGINX_APP_ROOT}|g" $x
done