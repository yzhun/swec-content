#!/bin/bash

docker run --rm $1 -p 8081:8081 --name nexus sonatype/nexus3
