#!/usr/bin/env bash

#
# Creates the docker image for the specified version of dbeaver.
# The program depends on the dbeaver archive that can be download using download.sh.
#
# Usage:
#   VERSION=24.1.2 ./build-image.sh
#
# The command above creates the docker image dbeaver-ce:24.1.2 using the arhive named dbeaver-ce-24.1.2.tgz 
# exiting with error code 1 if it does not exist. 
#

# set -eE: exits in case of error.
# set -u: error in case of missing variable.
# Use X=${X-default} (set X to default if X is not set) or X=${X:-default} 
#  (set X to default if X is not set or empty|null)
#  more information at 
#  https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html:
#   Put another way, if the colon is included, the operator tests for both 
#   parameter’s existence and that its value is not null; if the colon is 
#   omitted, the operator tests only for existence.
set -eEu

# enabled if and as needed: 
#  https://phoenixnap.com/kb/bash-trap-command
#  https://www.linuxjournal.com/content/bash-trap-command
#trap cleanup EXIT 1 2 3 6 15

[ -r /tmp/dbeaver-ce-$VERSION.tgz ] || { echo "dbeaver-ce-$VERSION not found, download it using download.sh" ; exit 1 ; }

docker build \
       --build-arg UID=$(id --user) --build-arg UNAME=$(id --user --name) \
       --build-arg GID=$(id --group) --build-arg GNAME=$(id --group --name) \
       --build-arg VERSION=$VERSION \
       --tag dbeaver-ce:$VERSION \
       .
