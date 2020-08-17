#!/bin/bash

source ./host

curl https://$HOST:2376/images/json \
  --cert ~/.docker/certs/cert.pem \
  --key ~/.docker/certs/key.pem \
  --cacert ~/.docker/certs/ca.pem
