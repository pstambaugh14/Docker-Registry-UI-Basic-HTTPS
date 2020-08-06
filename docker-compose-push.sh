#!/bin/bash

docker-compose push localhost:5000/pstambaugh14/registry-ui:latest

EXAMPLE:
#version: '3'
#services:
#  service1:
#    build: .
#    image: localhost:5000/yourimage  # goes to local registry
