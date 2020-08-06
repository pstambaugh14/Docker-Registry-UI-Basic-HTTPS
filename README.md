# Docker Registry UI with HTTP Basic Authentication and SSL Termination (HTTPS)
##https://github.com/pstambaugh14/Docker-Registry-UI-Basic-HTTPS/
## This is essentially a fork of: https://github.com/Joxit/docker-registry-ui

All credit is due to the original author 'Joxit' for creating the backbone of the docker-registry deployment as well as the dashboard.

I am simply looking to make things overly complicated for no reason XD.

Over-complications include: chained x509 certificate, HTTP-HTTPS 301 redirect, using HTTPS via SSL for UI, added debug/testing/building/devops scripts for configuration change  / build optimization, and added HTTP Basic Authentication for UI logins with hashed username/password in base64 configs.  

# GOALS
Currently:

## Completed Goals:
1) Configured Basic Authentication - Complete!
2) Working on HTTP-HTTPS redirect and: - Complete!
3) Fully utilizing an OpenSSL self-signed certificate to secure sessions. - Complete!
4) Added self-made script to expedite process of building process (recycle_docker.sh). -  Complete
   WARNING: do NOT run this if you are running other Docker Containers other than the ones we are testing - joxit/docker-registry-ui:static and registry:2.7.
   If you care to test this script to help expedite your build process, then please stop and rm all other running Docker containers until done with this script.  

## Future Goals:
1) No ideas as of yet... Hopefully some to come! :)


# Original Instructions
If you want to populate your registry, use populate.sh script. The interface will be accessible with http://localhost. Your docker registry will be accessible with http://localhost:5000.

The simplest way is with simple.yml docker-compose file.

docker-compose -f simple.yml up -d
./populate.sh

You can add some credentials to access your registry wit credentials.yml docker-compose file. Credentials for this example are login: registry and password: ui using bcrypt.

docker-compose -f credentials.yml up -d
./populate.sh

# Docker Registry UI as a Proxy with 301 HTTP-S redirect, HTTPS and Basic Authentication 

## recycle_docker.sh - What it does and how to use it.
For testing and building purposes, when making changes and using the mount points for volumes with configuration files that will be changed, you can run:
WARNING: Do NOT run this if you have other running Docker containers other than the Registry-UI and the Registry itself.  If you care to test this script then stop and remove all other running Docker containers until you are done testing the script!
```sh
./recycle_docker.sh
```
This Script will stop and remove all running Docker containers (in this case, to test our builds from registry-ui), run our docker-compose on our UI-PX-creds file, therefore re-instantiating our Docker Registry/UI containers with new configuration changes made in our local files that will be mounted by the docker containers via volumes.  I feel this method is a lot easier than having to recreate, reconfigure, rebuild and redeploy the Docker Image of either image - either way is fine - I am just leaving this here in case anyone decides to take this route instead...

Testing Integrated:  This script also has build-in testing once the containers are deployed to then show running Docker containers, display the default Basic Auth, tests the nginx configuration files for errors in the UI container, and follows HTTP redirects using 'cURL' with verbose output to help diagnose where any potential issues may lay from HTTP301 to HTTPS to HTTP on the registry:5000.  

## setup_PX_creds.sh - The startup script for a Docker Registry UI as a Proxy with 301 HTTP-S redirect, HTTPS and Basic Authentication 
To Run the Script:
```sh
./setup_PX_creds.sh
```
This will then spin up two containers via the docker_registry-UI-PX-creds-compose.yml: joxit/docker-registry-ui:static and registry:2.7.

## You can also use the 'simple' script and configurations to keep the Proxy HTTP and without Basic Authentication. But this is mainly made for the UI to be used as a Proxy using SSL termination and redirecting HTTP-HTTPS whilst also enabling HTTP Basic-Authenication to provide a username and password for web UI logins also.  
