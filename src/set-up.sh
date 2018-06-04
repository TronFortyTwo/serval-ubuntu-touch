#!/bin/bash

#
# This script set up servald in his right location and the config file
#
# this scrips sets up serval in
# ~/.cache/servald.emanuelesorce/
#

echo "setting up serval in ~/.cache/servald.emanuelesorce/"

# remove old stuff
rm -rf -v ~/.cache/serval.emanuelesorce/ && echo "wiped old directory"

# copy daemon
mkdir -p ~/.cache/serval.emanuelesorce/bin && echo "created bin sub-directory"
cp -v bin/servald ~/.cache/serval.emanuelesorce/bin && echo "moved servald"

# copy config file
mkdir -p ~/.cache/serval.emanuelesorce/etc/serval && echo "created etc/serval sub-directory"
cp -v serval.conf ~/.cache/serval.emanuelesorce/etc/serval/ && echo "moved configuration file"

echo "setting up completed"
