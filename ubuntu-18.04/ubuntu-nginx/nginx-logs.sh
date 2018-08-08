#!/bin/bash

# make sure we have a logs directory
if [[ ! -d /logs/nginx ]] ; then
    mkdir -p /logs/nginx
fi

# make sure we can use the logs directory
chown www-data /logs /logs/nginx
chmod 755 /logs /logs/nginx