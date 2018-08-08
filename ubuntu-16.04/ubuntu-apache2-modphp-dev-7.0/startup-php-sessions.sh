#!/bin/bash

if [[ ! -d /data/php-sessions ]] ; then
    mkdir /data/php-sessions
    chown -R www-data:www-data /data/php-sessions
fi