# serval-ubuntu-touch
Adaptation and packaging of the Serval Project for Ubuntu Touch devices

## Developing

You have to work on a Vivid container, as a OnTheRoad or Clickable (lxd or chroot, docker with some adaptation) one. inside the container you can start cloning this repo and using the build executable.

There are various steps to get a .click package:
1) Build serval-dna   --  ./build dna-build
2) Build QML gui   --  ./build gui-build
3) Package it all   --  ./build package

You can see all the commands available with
./build help

