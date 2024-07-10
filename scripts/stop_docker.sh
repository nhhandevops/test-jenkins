#!/bin/bash

#Pull new changes in repo

git pull origin main -C /home/ec2-user
#stop all container 
cd /home/ec2-user/test-jenkins && docker-compose -f nginx-jenkins-docker-compose.yml down