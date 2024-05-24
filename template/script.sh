#!/usr/bin/env bash

# For more information and licensing read more at https://github.com/emw7/@@REPOSITORY@@/blob/main/@@DIRECTORY@@/README.md

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
