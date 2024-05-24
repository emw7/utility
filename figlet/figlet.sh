#/usr/bin/env bash 

# For more information and licensing read more at https://github.com/emw7/utility/blob/main/figlet/README.md

# Usage:
#  figlet.sh "foo and bar"
#  ^^^ creates "foo and bar" using default font.
#  figlet.sh "foo and bar" MyFont
#  ^^^ creates "foo and bar" using MyFont font.
#  FONT=MyFont figlet.sh "foo and bar"
#  ^^^ creates "foo and bar" using MyFont font.

# set -eE: exits in case of error.
# set -u: error in case of missing variable.
set -eEu

# argument 2 overrides FONT environment variable.
FONT=${FONT-Doom}
FONT=${2:-$FONT}

docker run --rm -e FONT=$FONT -e TEXT="$1" figlet
