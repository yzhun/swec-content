#!/bin/bash

echo --- Update VM ---
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install mc

echo --- Install Talan ---
sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/project-talan/talan-core/latest/install.sh)"
sudo tln install java,maven,nodejs,docker,docker-compose

echo --- Check cmponents ---
java -version
mvn -v
node -v
npm -v
docker -v
docker-compose -v
