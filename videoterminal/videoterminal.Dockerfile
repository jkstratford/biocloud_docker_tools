#################################################################
# Dockerfile
#
# Ubuntu Base with Non-sudo user for recording videos
#
# Provides:
# Base Image: Ubuntu 24.04
# Build Cmd: docker build --rm -t rtibiocloud/videoterminal:v24.04 -f videoterminal.Dockerfile .
# Pull Cmd: docker pull rtibiocloud/videoterminal:v24.04
# Run Cmd: docker run --rm -v ${PWD}:/data rtibiocloud/videoterminal:v24.04 /bin/bash -c ""
# Run Cmd with generic user: docker run --rm -it --user 1000:1000 rtibiocloud/videoterminal:v24.04
#################################################################

FROM ubuntu:24.04

#----------------------------------------------------------------
# Container Metadata
#----------------------------------------------------------------
LABEL base.image="ubuntu:24.04"
LABEL software="wget, bzip2, unzip"
LABEL about.summary="a base ubuntu terminal for recording videos"

#----------------------------------------------------------------
# Install command line tools and packages
#----------------------------------------------------------------
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update && apt-get -y upgrade && \
        apt-get install -y --no-install-recommends \
    ca-certificates \
    wget \
    bzip2 \
    unzip && \
    apt-get clean && \
    apt-get autoremove && \
    wget --version 

#----------------------------------------------------------------
# Set working dir
#----------------------------------------------------------------
WORKDIR /data/
