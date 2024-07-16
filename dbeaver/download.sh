#!/usr/bin/env bash

#
# Downloads the desidered version of dbeaver to be used by build-image.sh.
# Desidered version is saved in the file named after the version.
# 
# Usage:
#   VERSION=24.1.2 ./download.sh
#
# The command above saves dbeaver in the file dbeaver-ce-24.1.2.tgz
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

curl -L -o /tmp/dbeaver-ce-$VERSION.tgz https://dbeaver.io/files/$VERSION/dbeaver-ce-$VERSION-linux.gtk.x86_64.tar.gz

