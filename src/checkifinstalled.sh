#!/bin/bash

if [ -f ~/.cache/serval.emanuelesorce/servald ]; then
	exit 0
fi

exit 1
