#!/bin/bash

echo
echo "Serval for Ubuntu Touch helper build script"
echo

OPTION="$1"

APPNAME="serval.emanuelesorce"

# help
if [ "$OPTION" == "help" ]; then
	echo "options:"
	echo "- help: show this screen"
	echo "- build: build serval-dna"
	echo "- configure: configure servald"
	echo
	exit 0
fi

# check the servald-dna project is in the directory
if [ ! -d serval-dna ]; then
	echo "--- Serval-dna repo is not present in this directory."
	echo "--- clone it?[Y/n]"

	read input

	if [ "$input" == n]; then
		echo "--- quitting then"
		exit 0
	fi

	# install git
	echo "--- Installing git..."
	apt install git

	# clone serval dna repo
	echo "--- Cloning serval-dna repo..."
	git clone https://github.com/servalproject/serval-dna
fi

# build option
if [ "$OPTION" == "build" ]; then

	# install dependencies
	echo "--- Installing build dependencies..."
	apt install autoconf automake build-essential clang libtool jq &&

	# we'll follow standard procedure as it is specified by INSTALL.md
	cd serval-dna

	echo "--- Building serval-dna..."

	# configure
	# We'll use clang instead of gcc since the vivid gcc version wont work
	# We'll set directories so that it can be packaged for ubuntu touch. Note: it require absolute path
	autoreconf -f -i -I m4 &&
	./configure CC="clang" --prefix="/home/phablet/.cache/$APPNAME" --sysconfdir="/home/phablet/.cache/$APPNAME/etc" --localstatedir="/home/phablet/.cache/$APPNAME/var" SERVAL_ETC_PATH="/home/phablet/.cache/$APPNAME/etc/serval" SERVAL_RUN_PATH="/home/phablet/.cache/$APPNAME/var/run/serval" SYSTEM_LOG_PATH="/home/phablet/.cache/$APPNAME/var/log" SERVAL_LOG_PATH="/home/phablet/.cache/$APPNAME/var/log/serval" RHIZOME_STORE_PATH="/home/phablet/.cache/$APPNAME/var/cache/serval" SERVAL_TMP_PATH="/home/phablet/.cache/$APPNAME/tmp/serval" &&
	# make
	make -j4

	echo
	echo "--- Build process finished"

	exit 0
fi

# configure daemon
if [ "$OPTION" == "configure" ]; then
	echo
	echo "--- Configuring..."
fi
