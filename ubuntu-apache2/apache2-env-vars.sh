#!/bin/bash

# defaults that may be set in Dockerfile
#
# why do we have two sets?
# - APACHE2_DEFAULT_* are for setting in Dockerfiles
# - when I've attempted to override them in docker-compose.yml. that
#   hasn't worked
APACHE2_DEFAULT_SITE_ROOT=${APACHE2_DEFAULT_SITE_ROOT:-/workspace/www}
APACHE2_DEFAULT_APP_SITE_CONF=${APACHE2_DEFAULT_APP_SITE_CONF:-static-site.conf}
APACHE2_DEFAULT_APP_SERVER_CONF=${APACHE2_DEFAULT_APP_SERVER_CONF:-empty.conf}

# the variables we will be substituting
APACHE2_SITE_ROOT=${APACHE2_SITE_ROOT:-${APACHE2_DEFAULT_SITE_ROOT}}
APACHE2_APP_SITE_CONF=${APACHE2_APP_SITE_CONF:-${APACHE2_DEFAULT_APP_SITE_CONF}}
APACHE2_APP_SERVER_CONF=${APACHE2_APP_SERVER_CONF:-${APACHE2_DEFAULT_APP_SERVER_CONF}}

# we assume a 'modern' app structure where most of the code lives outside
# the app's SITE_ROOT for security purposes
APACHE2_APP_ROOT=${APACHE2_APP_ROOT:-$(dirname ${APACHE2_SITE_ROOT})}

# tell the user what settings we are using
echo "Apache2: ___DEFAULT_ROOT___ is ${APACHE2_SITE_ROOT}"
echo "Apache2: ___APP_SITE_CONF___ is ${APACHE2_APP_SITE_CONF}"
echo "Apache2: ___APP_SERVER_CONF___ is ${APACHE2_APP_SERVER_CONF}"
echo "Apache2: ___APP_ROOT___ is ${APACHE2_APP_ROOT}"

# the NGINX files we will edit
APACHE2_FILES=$(find /etc/apache2 -type f)

# let's edit them
for x in $APACHE2_FILES ; do
    sed -i "s|___DEFAULT_ROOT___|${APACHE2_SITE_ROOT}|g" $x
    sed -i "s|___APP_SITE_CONF___|${APACHE2_APP_SITE_CONF}|g" $x
    sed -i "s|___APP_SERVER_CONF___|${APACHE2_APP_SERVER_CONF}|g" $x
    sed -i "s|___APP_ROOT___|${APACHE2_APP_ROOT}|g" $x
done

# the Supervisord files we will edit
SUPERVISORD_FILES=$(find /etc/supervisor -type f)

# let's edit them
for x in $SUPERVISORD_FILES ; do
    sed -i "s|___DEFAULT_ROOT___|${APACHE2_SITE_ROOT}|g" $x
    sed -i "s|___APP_SITE_CONF___|${APACHE2_APP_SITE_CONF}|g" $x
    sed -i "s|___APP_SERVER_CONF___|${APACHE2_APP_SERVER_CONF}|g" $x
    sed -i "s|___APP_ROOT___|${APACHE2_APP_ROOT}|g" $x
done