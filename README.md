# serval-ubuntu-touch
Adaptation and packaging of the Serval Project for Ubuntu Touch devices

## Developing

You have to work on a Vivid container, as a OnTheRoad or Clickable one. inside the container you can start cloning this repo and using the build.sh executable.

There are various steps to get a .click package:
1) Build serval-dna   --  ./build.sh dna-build
2) Build QML gui   --  ./buil.sh gui-build
3) Package it all   --  ./build.sh package

You can see all the commands available with
./build.sh help
