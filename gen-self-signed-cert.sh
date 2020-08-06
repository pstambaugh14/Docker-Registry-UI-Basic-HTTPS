#!/bin/bash

#Used to generate a chained, self-signed certificate for the registry-UI

###Although...WAS WORKING###
openssl req -newkey rsa:2048 -nodes -keyout nginx/privkey.pem -x509 -days 3650 -out nginx/fullchain.pem

#Improved:
#openssl req  -newkey rsa:4096 -nodes -sha256 -keyout nginx/docker_reg_certs/domain.key -x509 -days 365 -out nginx/docker_reg_certs/domain.crt
