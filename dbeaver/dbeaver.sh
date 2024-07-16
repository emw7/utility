#!/usr/bin/env bash

#
# Launches the specified version of dbeaver.
# The programs Depends on the docker image containing the specified version that can be created with build-image.sh.
#
# Usage:
#   VERSION=24.1.2 ./dbeaver.sh
#
# The command above launches a docker container from the dbeaver:24.1.2 image 
# exiting with an error if such a image does exist.
# The container is named dbeaver-24.1.2.
# The container is removed when it exists (when the running app is terminated, for example).
# The container is run in host network.
# To allow sharing data between different version to the container it is associated an 
#  anonymous volume[1]: -v $HOME/.local/share/DBeaverData:$HOME/.local/share/DBeaverData
#  (such a directory must be created manually on the host is it does not exists).
#
# Notes:
# (1) : it seems that, even using XDG_DATA_HOME as stated by dbeaver documentation 
#       https://github.com/dbeaver/dbeaver/wiki/Workspace-Location, 
#       dbeaver points to $HOME/.local/share/DBeaverData, so after lots of 
#       tries it has been decided to bind 1-to-1 host dbeaver data directory to 
#       container directory.
# (2) : [IMPORTANT] dbeaver allow to specify the -data command line argument, but it is 
#       only for specifying the workspace files and not other files; 
#       example: the command dbeaver -data /tmp/myfiles tells dbeaver to put workspace files 
#                into /tmp/myfiles but other files are put into $HOME/.local/share/DBeaverData
#       That is a deduction inferred by what has been seen after lots of tries, but it could 
#       be wrong.
# (3) : [LIMITATION] to avoid problems with permissions with shared data, the image is created 
#       adding a user with same name, id and group of the user that creates the image; this 
#       limits the usage of the image to the user that created the image.
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

docker run --name dbeaver-$VERSION --rm -w $HOME -it --env DISPLAY=$DISPLAY --network host -v $HOME/.local/share/DBeaverData:$HOME/.local/share/DBeaverData dbeaver-ce:$VERSION

