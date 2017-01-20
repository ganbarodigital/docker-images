#!/bin/bash

for x in `echo /usr/local/image-startup/*.sh` ; do
    echo "Running startup script: $x"
    $x
done

if [[ -d /workspace/image-startup ]] ; then
    for x in `echo /workspace/image-startup/*` ; do
        $x
    done
fi

exec /usr/bin/supervisord -c /etc/supervisor/supervisord.conf