#!/bin/bash

#
# This script set up servald in his right location and the config file
#
# this scrips sets up serval in
# ~/.cache/servald.emanuelesorce/
#

# remove old stuff
rm -rf -v ~/.cache/serval.emanuelesorce/
mkdir -p ~/.cache/serval.emanuelesorce/

# copy daemon
cp -v bin/servald ~/.cache/serval.emanuelesorce/

# copy config file
cp -v serval.conf ~/.cache/serval.emanuelesorce/
