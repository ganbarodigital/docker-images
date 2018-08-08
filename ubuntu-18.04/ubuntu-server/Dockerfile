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

FROM ubuntu:18.04
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
    && apt-get install -y screen tmux curl wget iputils-ping sudo vim \
    && apt-get install -y build-essential pkg-config git autoconf automake libtool m4 \
    && apt-get install -y openssl

ENV DOCKER_VERSION 1.12.0
ENV KUBERNETES_VERSION 1.6.4

# Install docker client
#
# we need this for systems like OpenWhisk, which will want to
# communicate with Docker to spin up new images
RUN curl -sSL -o docker-${DOCKER_VERSION}.tgz https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz \
    && tar --strip-components 1 -xvzf docker-${DOCKER_VERSION}.tgz -C /usr/bin docker/docker \
    && tar --strip-components 1 -xvzf docker-${DOCKER_VERSION}.tgz -C /usr/bin docker/docker-runc \
    && rm -f docker-${DOCKER_VERSION}.tgz \
    && chmod +x /usr/bin/docker \
    && chmod +x /usr/bin/docker-runc

# Install kubernetes client
RUN wget --no-verbose https://storage.googleapis.com/kubernetes-release/release/v${KUBERNETES_VERSION}/bin/linux/amd64/kubectl \
    && chmod +x kubectl \
    && mv kubectl /usr/bin/kubectl

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
