#!/bin/bash

# ensure running bash
if ! [ -n "$BASH_VERSION" ];then
    echo "this is not bash, calling self with bash....";
    SCRIPT=$(readlink -f "$0")
    /bin/bash $SCRIPT
    exit;
fi

# Setup for relative paths.
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT") 
cd $SCRIPTPATH

# load the variables from the relative path
source ../app/.env


if [[ $REGISTRY ]]; then
    CONTAINER_IMAGE="`echo $REGISTRY`/`echo $PROJECT_NAME`"
else
    CONTAINER_IMAGE="`echo $PROJECT_NAME`"
fi

# Kill the site if it is already running.
# e.g. we are replacing the container
docker kill $PROJECT_NAME
docker rm $PROJECT_NAME


# Now start our site container.
docker run -d \
  -p 80:80 \
  -p 443:443 \
  --env-file ../app/.env \
  --restart=always \
  --name="$PROJECT_NAME" \
  $CONTAINER_IMAGE

