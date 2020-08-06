#!/bin/bash
docker-compose -f docker_registry-UI-PX-simple-compose.yml up -d
./populate.sh
