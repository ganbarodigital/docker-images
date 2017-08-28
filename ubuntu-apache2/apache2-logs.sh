#!/bin/bash

# make sure we have a logs directory
if [[ ! -d /logs/apache2 ]] ; then
    mkdir -p /logs/apache2
fi

# make sure we can use the logs directory
chown www-data /logs /logs/apache2
chmod 755 /logs /logs/apache2