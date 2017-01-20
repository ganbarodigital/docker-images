#!/bin/bash

if [[ ! -d /workspace/logs/nginx ]] ; then
    mkdir -p /workspace/logs/nginx
fi

chown www-data /workspace/logs /workspace/logs/nginx
chmod 755 /workspace/logs /workspace/logs/nginx