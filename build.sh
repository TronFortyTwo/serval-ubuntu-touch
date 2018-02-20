#!/bin/bash

# check the servald-dna project is in the directory
if [ ! -d serval-dna ]; then
	echo "Serval-dna repo is not present in this directory."
	echo "clone it?[Y/n]"

	read input

	if [ "$input" == n]; then
		echo "quitting then"
		exit 0
	fi

	# install git
	echo "Installing git..."
	apt install git

	# clone serval dna repo
	echo "Cloning serval-dna repo..."
	git clone https://github.com/servalproject/serval-dna
fi

# install dependencies
echo "Installing build dependencies..."
apt install autoconf automake build-essential clang libtool jq &&

# since Vivid gcc (4.9.2) is outdated and fails, we'll build using clang
# we'll follow standard procedure as it is specified by INSTALL.md
cd serval-dna

echo "Building serval-dna"
autoreconf -f -i -I m4 &&
./configure CC="clang" &&
make -j4 || echo "Build failed!"
