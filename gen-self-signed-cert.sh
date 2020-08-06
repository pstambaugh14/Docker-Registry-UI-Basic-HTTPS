#!/bin/bash

#Used to generate a chained, self-signed certificate for the registry-UI

openssl req -newkey rsa:2048 -nodes -keyout nginx/privkey.pem -x509 -days 3650 -out nginx/fullchain.pem
