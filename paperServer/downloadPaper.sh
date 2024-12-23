#!/bin/bash
#Scarica Paper
wget -O paper.jar https://api.papermc.io/v2/projects/paper/versions/1.20.4/builds/416/downloads/paper-1.20.4-416.jar
#wget -O paper.jar https://api.papermc.io/v2/projects/paper/versions/1.20.1/builds/157/downloads/paper-1.20.1-157.jar

mkdir /app
mkdir ~/paper-data
echo "eula=true" > ~/paper-data/eula.txt
cp paper.jar ~/paper-data
cp paper.jar /app/
