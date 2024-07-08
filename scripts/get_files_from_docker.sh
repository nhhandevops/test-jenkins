#!/bin/bash

#Check if the container is created 
docker rm temp-wordpress

#create a tempory container used to new pushed
docker create --name temp-wordpress nhhan2504/wordpress:version1

#Copy the new files from the container 
docker cp temp-wordpress:/var/www/html/wp-admin ./wordpress-new/