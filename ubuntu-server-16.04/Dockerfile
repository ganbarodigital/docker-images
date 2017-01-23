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

# Important to keep on top of the latest security fixes et al
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

# Basic stuff to keep Ubuntu happy
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y apt-utils

# misc UNIX commands for use in child images
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y screen tmux curl

# compilers etc, needed to build things
# yes, we are putting compilers in an image
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential pkg-config git autoconf automake libtool m4

# the mount points for Docker volumes
RUN mkdir -m 0777 /workspace
RUN mkdir -m 0777 /logs
RUN mkdir -m 0777 /data
RUN mkdir -m 0777 /config

# Supervisor
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y supervisor
COPY supervisord.conf /etc/supervisor/supervisord.conf

# Our image-startup feature
RUN mkdir -m 0755 /usr/local/image-startup
COPY image-startup.sh /usr/local/sbin/image-startup.sh
RUN chmod 755 /usr/local/sbin/image-startup.sh

# all done
CMD /usr/local/sbin/image-startup.sh
