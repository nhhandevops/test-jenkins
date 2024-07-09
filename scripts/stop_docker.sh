#!/bin/bash

#get new update in repo
git pull origin main

#stop all container 
cd
cd test-jenkins
docker-compose -f nginx-jenkins-docker-compose.yml down