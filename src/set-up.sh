#!/bin/bash

#
# This script set up servald in his right location and the config file
#
# this scrips assumes to be located on:
# /opt/click.ubuntu.com/servald.emanuelesorce/current/
#
# and sets up serval in
# ~/.cache/servald.emanuelesorce/
#

# remove old stuff
rm -r -v ~/.cache/serval.emanuelesorce/

# copy daemon
mkdir ~/.cache/serval.emanuelesorce/
mkdir ~/.cache/serval.emanuelesorce/bin
cp -v servald ~/.cache/serval.emanuelesorce/bin

# copy config file
mkdir ~/.cache/serval.emanuelesorce/etc
mkdir ~/.cache/serval.emanuelesorce/etc/serval
cp -v serval.conf ~/.cache/serval.emanuelesorce/etc/serval/
