#!/bin/bash

#Used to generate a chained, self-signed certificate for the registry-UI

echo ""
echo "Setup and Creation of NGINX Reverse Web Proxy for Registry UI Certificates"
echo ""

###Although...WORKING (NGINX Registy UI)###
openssl req -newkey rsa:2048 -nodes -keyout ./nginx/privkey.pem -x509 -days 3650 -out ./nginx/fullchain.pem

###Alternative_Setup - Wasn't Working###:
#openssl req  -newkey rsa:4096 -nodes -sha256 -keyout nginx/docker_reg_certs/domain.key -x509 -days 365 -out nginx/docker_reg_certs/domain.crt

echo ""
echo "Setup and Creation of Docker Registry Certificates"
echo ""

#Create the Certs Directory and Certificate + Key:
mkdir -p ./certs
###Working - For the Registry!!
openssl req  -newkey rsa:4096 -nodes -sha256 -keyout ./certs/domain.key -x509 -days 365 -out ./certs/domain.crt

echo ""
read -p "What is the IP Address which you'd like the Docker Registry to Listen On?: " IP 
echo""

#Create a Docker certs directory, add domain.crt as ca.crt to Docker and Linux:
echo ""
echo "Creating Directory /etc/docker/certs.d/"${IP}""
echo ""
mkdir -p /etc/docker/certs.d/"${IP}"
echo ""
echo "Copying ./certs/domain.crt to /etc/docker/certs.d/"${IP}"/ca.crt"
cp ./certs/domain.crt /etc/docker/certs.d/"${IP}"/ca.crt
echo ""
echo "Copying /certs/domain.crt to /usr/local/share/ca-certificates/ca.crt"
cp ./certs/domain.crt /usr/local/share/ca-certificates/ca.crt
echo ""
echo "Updating CA Certificates Locally"
update-ca-certificates
echo ""
echo "All Done!"
