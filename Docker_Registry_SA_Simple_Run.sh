#!/bin/bash

#Script to run registry-ui and configure appropriately

#docker run -d --name registry --network=alpinegit --ip 172.18.0.137 -p 80:80 --rm docker pull joxit/docker-registry-ui:static

docker network create registry-ui-net

docker pull joxit/docker-registry-ui:static

docker run -d \
  -p 5000:5000 \
  --restart=always \
  --name registry \
  -v ./registry_data:/var/lib/registry \
  registry:2

docker pull joxit/docker-registry-ui:static

docker network create registry-ui-net

docker run -d --net registry-ui-net --name registry-srv registry:2

#docker run -d --name registry --network=registry-ui-net --ip 172.18.0.137 -p 80:80 --rm docker pull joxit/docker-registry-ui:static

#docker run -d --name registry --network=registry-ui-net -p 80 --rm docker pull joxit/docker-registry-ui:static

#docker run -d --net registry-ui-net -p 80:80 -e REGISTRY_URL=http://registry-srv:5000 -e DELETE_IMAGES=true -e REGISTRY_TITLE="My registry" joxit/docker-registry-ui:static

docker run -d --name registry-ui --net registry-ui-net -p 80 -e REGISTRY_URL=http://127.0.0.1:5000 -e DELETE_IMAGES=true -e REGISTRY_TITLE="My registry" joxit/docker-registry-ui:static


#docker run -d \
#  -p 5000:5000 \
#  --restart=always \
#  --name registry \
#  -v /media/backup/Docker_Registry:/var/lib/registry \
#  registry:2
