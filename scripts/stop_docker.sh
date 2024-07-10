#!/bin/bash

#Pull new changes in repo
cd /home/ec2-user/ && git clone https://github.com/nhhandevops/test-jenkins.git
cd /home/ec2-user/test-jenkins && git pull origin main -C /home/ec2-user
#stop all container 
cd /home/ec2-user/test-jenkins && docker-compose -f nginx-jenkins-docker-compose.yml down