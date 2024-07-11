#!/bin/bash

#Run docker compose wordpress
cd /home/ec2-user/test-jenkins && docker-compose -f nginx-jenkins-docker-compose.yml up -d
