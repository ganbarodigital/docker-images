# Copyright 2015-present Ganbaro Digital Ltd
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
#   * Redistributions of source code must retain the above copyright
#     notice, this list of conditions and the following disclaimer.
#
#   * Redistributions in binary form must reproduce the above copyright
#     notice, this list of conditions and the following disclaimer in
#     the documentation and/or other materials provided with the
#     distribution.
#
#   * Neither the names of the copyright holders nor the names of his
#     contributors may be used to endorse or promote products derived
#     from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
# FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
# COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
# ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.

FROM ganbarodigital/ubuntu-nginx-phpdev:7.0-20180808.01
MAINTAINER Stuart Herbert <stuherbert@ganbarodigital.com>

# default value for Nginx param substitutions
ENV NGINX_DEFAULT_SITE_ROOT=/workspace/app/public
ENV NGINX_DEFAULT_APP_SERVER_CONF=php-fastcgi.conf

# AppServer configs
RUN rm /etc/supervisor/conf.d/php-fpm.conf
RUN rm /etc/nginx/php-fpm.conf
COPY nginx.php-fastcgi.conf /etc/nginx/php-fastcgi.conf
COPY nginx.phpfastcgi.conf /etc/nginx/conf.d/phpfastcgi.conf
COPY supervisor.phpfastcgi.conf /etc/supervisor/conf.d/phpfastcgi.conf

# Production PHP config files
COPY fpm.php.ini /etc/php/7.0/fpm/php.ini
COPY php.opcache.ini /etc/php/7.0/mods-available/opcache.ini