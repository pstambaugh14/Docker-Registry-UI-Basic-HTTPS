# https://github.com/pstambaugh14/Docker-Registry-UI-Basic-HTTPS/
## This is essentially a fork of: https://github.com/Joxit/docker-registry-ui

All credit is due to the original author for creating the backbone of the docker-registry deployment as well as the dashboard.

I am simply looking to make things overly complicated for no reason XD.

## GOALS
Currently:

1) Configured Basic Authentication
2) Working on HTTP-HTTPS redirect and:
3) Fully utilizing an OpenSSL self-signed certificate to secure sessions.

Docker Registry Static as standalone example

You can set up the static user interface as standalone in several ways.

If you want to populate your registry, use populate.sh script. The interface will be accessible with http://localhost. Your docker registry will be accessible with http://localhost:5000.

The simplest way is with simple.yml docker-compose file.

docker-compose -f simple.yml up -d
./populate.sh

You can add some credentials to access your registry wit credentials.yml docker-compose file. Credentials for this example are login: registry and password: ui using bcrypt.

docker-compose -f credentials.yml up -d
./populate.sh
# Docker-Registry-UI-Basic-HTTPS
