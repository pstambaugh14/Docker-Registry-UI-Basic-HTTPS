#!/bin/bash
docker-compose -f docker_registry-UI-PX-creds-compose.yml up -d 
./populate.sh
