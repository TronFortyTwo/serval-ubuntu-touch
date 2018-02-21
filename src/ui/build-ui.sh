#!/bin/bash

# dependencies
echo
echo "--- Installing dependencies..."
echo
apt install cmake libqt5declarative5 intltool qtbase5-dev qtdeclarative5-dev

# Move files to the build locations
echo
echo "--- Building..."
echo

mkdir build
cp -v CMakeLists.txt build
cp -v -r plugins build
cp -v -r po build
cp -v -r qml build

# build
cd build
cmake .
make -j4

# install plugin
cd qml
mkdir Template
cp -v -r ../plugins/Template/qmldir Template
cp -v -r ../plugins/Template/Template/libTemplate.so Template
cd ..