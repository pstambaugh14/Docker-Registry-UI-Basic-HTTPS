#!/bin/bash

#Working Example of a non-interactive return of command into stdout (host box's terminal session.)
#This will run the given command into every running Docker container."


#Docker ps -aq command will return all of the running container ID's line-by-line (carriage return) and output into the tmp file.
docker ps -aq --filter status=running > /tmp/dckrpsaq.tmp
#Iteration beginning
i=0
#While loop to 'read' 'line' (automatically knows to read data, line by line via a file).  Will run until $i < total number of lines in the sourced file.
while read line
#Do
do
	#Creates a variable named $line - 'arr' array that retrieves the $i element - IE - sets array from each line in file and indexes and assigns string as variable per $line.
	arr[$i]="$line"
	#The Docker execuction command using only -t to return from psuedo-tty data to host stdout into newly formed line variable (in this case, the container ID/hostname).
	#bin/sh -c needs to be called in order to perform the correct functions via shell.  Then, finally the actual non-interactive command we're running:
	#docker exec -t "${line}" /bin/sh -c 'cat /etc/hostname' #Change 'cat /etc/hostname' to change the non-interactive command desired to be run. 
        echo "Stopping container "${line}"..." 
	docker stop "${line}" 
	echo "Removing container "${line}"..."
	docker rm "${line}"
	### Apparently: /bin/bash -l could work at times as well, although the demo was specific to a 'run', NOT 'exec' instance of Docker's CLI. ###
	#Iterate +1
	i=$((i+1))
#Finishes while loop and sources the array list we've made via docker -aq and outputted to the temp file.
done < /tmp/dckrpsaq.tmp
#Erases the temp file.
rm -f /tmp/dckrpsaq.tmp

docker-compose -f docker_registry-UI-SA-creds-compose.yml up -d
./populate.sh

sleep 2

echo ""
echo "Default Username is 'registry' and default password is 'ui'"
echo ""


echo "Validation of Docker Containers:"
docker ps -a

echo ""
echo "And Testing the Containers..."
echo ""
echo "Validating NGinx configurations and directives..."
echo ""
uiname=`docker ps -aq --filter name=docker_registry_ui_1`
docker exec -it "${uiname}" nginx -t
echo ""
echo "Application Layer Test via HTTP(S) hops..."
echo ""
curl -v -I -L -k --insecure localhost
echo "" 
echo "Recycle is now complete.  Please check stdout in shell to analyze progress / issues / completion status! :)"

