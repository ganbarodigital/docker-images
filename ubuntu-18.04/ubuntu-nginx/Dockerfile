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

FROM ganbarodigital/ubuntu-server:18.04-develop
MAINTAINER Stuart Herbert <stuherbert@ganbarodigital.com>

# Nginx
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nginx \
    && apt-get autoremove -y \
    && apt-get clean

COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx.drop.conf /etc/nginx/drop.conf
COPY nginx.images.conf /etc/nginx/images.conf
COPY nginx.static-site.conf /etc/nginx/static-site.conf
COPY nginx.default.conf /etc/nginx/sites-available/default
COPY supervisor.nginx.conf /etc/supervisor/conf.d/nginx.conf
COPY nginx-logs.sh /usr/local/image-startup/20-nginx-logs.sh
RUN touch /etc/nginx/empty.conf
RUN chmod 755 /usr/local/image-startup/20-nginx-logs.sh
COPY nginx-env-vars.sh /usr/local/image-startup/21-nginx-env-vars.sh
RUN chmod 755 /usr/local/image-startup/21-nginx-env-vars.sh
