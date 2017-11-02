#!/bin/bash

# defaults that may be set in Dockerfile
#
# why do we have two sets?
# - PHP_DEFAULT_* are for setting in Dockerfiles
# - when I've attempted to override them in docker-compose.yml. that
#   hasn't worked
PHP_DEFAULT_TIMEOUT=60

# the variables we will be substituting
PHP_TIMEOUT=${PHP_TIMEOUT:-${PHP_DEFAULT_TIMEOUT}}

# tell the user what settings we are using
echo "PHP: ___PHP_TIMEOUT___ is ${PHP_TIMEOUT}"

# the Apache files we will edit
APACHE_FILES=$(find /etc/apache2 -type f)

# let's edit them
for x in $APACHE_FILES ; do
    sed -i "s|___PHP_TIMEOUT___|${PHP_TIMEOUT}|g" $x
done

# the PHP files we will edit
PHP_FILES=$(find /etc/php -type f)

# let's edit them
for x in $PHP_FILES ; do
    sed -i "s|___PHP_TIMEOUT___|${PHP_TIMEOUT}|g" $x
done