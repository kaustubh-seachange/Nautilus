#!/bin/bash
#
# Container build script for conseil

#cd "$HOME"

if [[ -d ./Conseil ]] ; then
    cd Conseil
    git pull
else
    git clone https://github.com/Cryptonomic/Conseil.git
    cd Conseil
fi


sbt 'set logLevel in compile := Level.Error' compile
sbt 'set test in assembly := {}' assembly




