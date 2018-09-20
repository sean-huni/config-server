#!/usr/bin/env bash

# Script to deploy the app
deploy(){
# From the remote host-machine, run the following cmd
    docker pull s34n/config-img
    docker run --name='config' -d -it -p 8002:8002 s34n/config-img && docker logs config -f
}

# Tag-And-Push Script to tag & push the app
tagAndPush(){
    docker tag config-img:latest s34n/config-img:latest
    docker push s34n/config-img:latest
}

# Rebuild-Script to clean & build the app using the Dockerfile script
rebuild(){
    gradle clean
    gradle build
    docker build -f Dockerfile -t config-img .
    tagAndPush
}

# Let's get rid of the pre-existing docker images on the machine.
if [[ ! -z "$(docker container ps | grep config)" ]]; then
    echo "Config-Service Docker Container Found"
    docker stop config && docker rm config && docker rmi config-img
    rebuild
else
    echo "Config-Service Docker Container NOT Found"
    rebuild
fi

