#!/bin/bash

echo --- Update VM ---
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install mc

echo --- Install Talan ---
sudo tln install java,maven,docker,docker-compose

echo --- Install Angular CLI ---
sudo npm install -g @angular/cli

echo --- Check cmponents ---
java -version
mvn -v
node -v
npm -v
docker -v
docker-compose -v
