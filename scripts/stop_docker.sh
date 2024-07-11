#!/bin/bash

#Pull new changes in repo

git pull origin main
docker-compose -f nginx-jenkins-docker-compose.yml down