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

FROM ubuntu:16.04
MAINTAINER Stuart Herbert <stuherbert@ganbarodigital.com>

# make sure that apt does not complain
ENV DEBIAN_FRONTEND=noninteractive

# set our preferred list of Ubuntu package sources
COPY apt.sources.list /etc/apt/sources.list

# what does this do?
#
# 1. make sure we have latest package lists (so apt doesn't crap out)
# 2. make sure we have latest security fixes
# 3. tools to stop apt complaining in the logs
# 4. unix commands that child images will want
# 5. compilers that child images will want
RUN set -xe \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y apt-utils \
    && apt-get install -y screen tmux curl iputils-ping sudo vim \
    && apt-get install -y build-essential pkg-config git autoconf automake libtool m4

# the mount points for Docker volumes
RUN set -xe \
    && mkdir -m 0777 /workspace \
    && mkdir -m 0777 /logs \
    && mkdir -m 0777 /data \
    && mkdir -m 0777 /config

# Supervisor
RUN apt-get install -y supervisor
COPY supervisord.conf /etc/supervisor/supervisord.conf

# Our image-startup feature
RUN mkdir -m 0755 /usr/local/image-startup
COPY image-startup.sh /usr/local/sbin/image-startup.sh
RUN chmod 755 /usr/local/sbin/image-startup.sh

# all done
CMD /usr/local/sbin/image-startup.sh
