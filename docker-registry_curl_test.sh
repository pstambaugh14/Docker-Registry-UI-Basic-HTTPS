#!/bin/bash

source ./host

PWD=`pwd`

CERT=`find "${PWD}/certs/registry_ca_certs" -type f -name 'cert.pem'`
KEY=`find "${PWD}/certs/registry_ca_certs" -type f -name 'key.pem'`
CA=`find "${PWD}/certs/registry_ca_certs" -type f -name 'ca.pem'`

#curl https://"${HOST}":2376/images/json   --cert "${CERT}" --key "${KEY}"   --cacert "${CA}"

#curl https://"${HOST}":5000/images/json   --cert "${CERT}" --key "${KEY}"   --cacert "${CA}"

curl -X GET "https://"${HOST}":2376/v1.40/containers/json?all=false&size=false" -H  "accept: application/json" \
--cert ~/.docker/certs/cert.pem --key ~/.docker/certs/key.pem --cacert ~/.docker/certs/ca.pem | jq
