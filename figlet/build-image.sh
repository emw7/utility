#/usr/bin/env bash 

# set -eE: exits in case of error.
# set -u: error in case of missing variable.
set -eEu

ALPINE_VERSION=${ALPINE_VERSION-3.20.0}

docker build --build-arg ALPINE_VERSION=${ALPINE_VERSION} \
       -t figlet:${ALPINE_VERSION} -t figlet:latest .
