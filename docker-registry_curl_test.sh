#!/bin/bash

source host

PWD=`pwd`

CERT=`find "${PWD}/certs/registry_ca_certs" -type f -name 'cert.pem'`
KEY=`find "${PWD}/certs/registry_ca_certs" -type f -name 'key.pem'`
CA=`find "${PWD}/certs/registry_ca_certs" -type f -name 'ca.pem'`

curl https://"${HOST}":2376/images/json   --cert "${CERT}" --key "${KEY}"   --cacert "${CA}"
