#!/bin/bash

#You can add some credentials to access your registry wit credentials.yml docker-compose file. 

#Credentials for this example are login: registry and password: ui using bcrypt.

#docker network create docker_registry

docker-compose -f docker_registry-UI-PX-creds-compose.yml up -d
./populate.sh


echo ""
echo "Default Username is 'registry' and default password is 'ui'"
echo ""

docker ps -a
