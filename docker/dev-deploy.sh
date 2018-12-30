#!/bin/bash
# This script is the same as the deploy script except that it will
# use a volume for the app so you don't have to keep rebuilding and deploying
# the container whilst making changes as you develop your website.

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
  -v $SCRIPTPATH/../app:/var/www/my-site \
  $CONTAINER_IMAGE

