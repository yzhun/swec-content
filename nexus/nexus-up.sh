#!/bin/bash

$ mkdir /opt/nexus-data && chown -R 200 /opt/nexus-data
$ docker run --rm $1 -p 8081:8081 --name nexus -v /opt/nexus-data:/nexus-data sonatype/nexus3
