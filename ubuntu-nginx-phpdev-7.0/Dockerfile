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

FROM ganbarodigital/ubuntu-nginx:16.04-3.6.0
MAINTAINER Stuart Herbert <stuherbert@ganbarodigital.com>

# default value for Nginx param substitutions
ENV NGINX_DEFAULT_SITE_ROOT=/workspace/app/public
ENV NGINX_DEFAULT_APP_SITE_CONF=php-site.conf
ENV NGINX_DEFAULT_APP_SERVER_CONF=php-fpm.conf

# PHP-FPM for Nginx
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y php-fpm php-dev php-pear php-mysql php-bz2 php-intl php-mbstring php-memcache php-memcached php-phpdbg php-curl php-gd php-imagick php-bcmath php-xml
COPY nginx.php-fpm.conf /etc/nginx/php-fpm.conf
COPY nginx.php-site.conf /etc/nginx/php-site.conf
COPY php-fpm.conf /etc/php/7.0/fpm/php-fpm.conf
RUN mkdir /run/php
RUN chown www-data:www-data /run/php
COPY supervisor.php-fpm.conf /etc/supervisor/conf.d/php-fpm.conf
COPY fpm.php.ini /etc/php/7.0/fpm/php.ini

# Composer support
RUN curl https://getcomposer.org/installer -o composer-setup.php \
    && php composer-setup.php --quiet \
    && rm composer-setup.php \
    && mv composer.phar /usr/bin/composer \
    && chmod 755 /usr/bin/composer

# MySQL
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-client

# on startup ...
COPY startup-php-logs.sh /usr/local/image-startup/30-php-logs.sh
COPY startup-php-sessions.sh /usr/local/image-startup/30-php-sessions.sh
COPY startup-php-env-vars.sh /usr/local/image-startup/21-php-env-vars.sh
RUN chmod 755 /usr/local/image-startup/30-php-logs.sh
RUN chmod 755 /usr/local/image-startup/30-php-sessions.sh
RUN chmod 755 /usr/local/image-startup/21-php-env-vars.sh