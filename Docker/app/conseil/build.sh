#!/bin/bash


mkdir $1-temp && cd $1-temp

git clone https://github.com/Cryptonomic/Conseil.git
cd Conseil

sbt 'set logLevel in compile := Level.Error' compile
sbt 'set test in assembly := {}' assembly
cp ./src/main/resources/application.conf ./build/
cp ./src/main/resources/logback.xml ./build/

cd ..
ln -s ./$1-temp/Conseil ./build
cp ./$1-temp/Conseil/src/main/resources/application.conf ./build/
cp ./$1-temp/Conseil/src/main/resources/logback.xml ./build/

mv /tmp/conseil.jar ./build/conseil.jar
cp ./env/$1/conseil.conf ./build/
cp ./env/$1/runconseil-lorre.sh ./build/

docker build -f dockerfile -t conseil-$1 .

rm ./build