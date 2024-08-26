#################################################################
# Dockerfile
#
# Running TargetDB
# Publication:
#     https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0232644
# Source Code: 
#     https://github.com/sdecesco/targetDB 
#
# Software: TargetDB
# Software Version: v1.3.1
#
# Provides:
# Base Image: Ubuntu 24.04
# Build Cmd: docker build --rm -t rtibiocloud/targetdb:v1.3.1 -f targetdb.Dockerfile .
# Pull Cmd: docker pull rtibiocloud/targetdb:v1.3.1
# Run Cmd: docker run --rm -v ${PWD}:/data rtibiocloud/targetdb:v1.3.1 /bin/bash -c ""
#################################################################

FROM ubuntu:24.04

#----------------------------------------------------------------
# Container Metadata
#----------------------------------------------------------------
LABEL base.image="ubuntu:24.04"
LABEL software="git, python3, pip, wget, bzip2, unzip"
LABEL software.version="v1.3.1"
LABEL about.summary="Docker for running TargetDB"
LABEL license="https://github.com/sdecesco/targetDB/blob/master/LICENSE"
LABEL about.tags="Drug Repurposing"

#----------------------------------------------------------------
# Install command line tools and packages
#----------------------------------------------------------------
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update && apt-get -y upgrade && \
        apt-get install -y --no-install-recommends \
    git \
    pkg-config \
    python3-pip \
    python3-dev \
    python3-tk \
    ca-certificates \
    wget \
    bzip2 \
    unzip \ 
    firefox && \
    apt-get clean && \
    apt-get autoremove && \
        ln -s /usr/bin/python3 /usr/bin/python 

#----------------------------------------------------------------
# Setup X11 forwarding so that you can access the GUI
#----------------------------------------------------------------
# https://stackoverflow.com/questions/43508481/running-x-windows-desktop-apps-in-docker-containers-on-windows-10

#----------------------------------------------------------------
# Get the source code
#----------------------------------------------------------------
RUN git clone https://github.com/sdecesco/targetDB.git -O /opt/targetDB
#  && \
#    tar -xvzf /opt/targetDB.tar.gz -d /opt/targetDB && \
#    mv /opt/targetDB/targetDB-1.3.1/* /opt/targetDB/ && \
#    rm -r /opt/targetDB/targetDB-1.3.1/ && \
#    rm /opt/targetDB.tar.gz

#----------------------------------------------------------------
# Download the database
#----------------------------------------------------------------
RUN wget https://zenodo.org/communities/targetdb -O /opt/targetDB/targetdb

#----------------------------------------------------------------
# Setup Python Packages
#----------------------------------------------------------------
RUN pip install -r /opt/targetDB/requirements.txt --break-system-packages
RUN monkeybrains

#----------------------------------------------------------------
# Set working dir
#----------------------------------------------------------------
WORKDIR /data/
