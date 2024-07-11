#!/bin/bash

#Pull new changes in repo
cd /home/ec2-user/test-jenkins \
    && git pull origin main \
    && docker-compose -f nginx-jenkins-docker-compose.yml down