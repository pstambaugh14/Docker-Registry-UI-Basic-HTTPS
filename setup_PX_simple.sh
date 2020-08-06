#!/bin/bash
docker-compose -f docker_registry-UI-SA-simple-compose.yml up -d
./populate.sh
