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

FROM ganbarodigital/ubuntu-server:16.04-3.5.0
MAINTAINER Stuart Herbert <stuherbert@ganbarodigital.com>

# Apache2
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y apache2
# these default config files are of questionable benefit
RUN cd /etc/apache2/conf-enabled && a2disconf *
# useful modules that everyone will want
RUN a2enmod headers rewrite

COPY apache2.envvars /etc/apache2/envvars
COPY apache2.static-site.conf /etc/apache2/static-site.conf
COPY apache2.default.conf /etc/apache2/sites-available/000-default.conf
RUN touch /etc/apache2/empty.conf

COPY supervisor.apache2.conf /etc/supervisor/conf.d/apache2.conf

COPY apache2-logs.sh /usr/local/image-startup/20-apache2-logs.sh
RUN chmod 755 /usr/local/image-startup/20-apache2-logs.sh
COPY apache2-env-vars.sh /usr/local/image-startup/21-apache2-env-vars.sh
RUN chmod 755 /usr/local/image-startup/21-apache2-env-vars.sh
