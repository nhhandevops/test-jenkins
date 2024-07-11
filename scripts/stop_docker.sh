#!/bin/bash

#Pull new changes in repo
cd test-jenkins && git pull origin main

docker-compose -f nginx-jenkins-docker-compose.yml down