#!/bin/bash
if ! [ -n "$BASH_VERSION" ];then
    echo "this is not bash, calling self with bash....";
    SCRIPT=$(readlink -f "$0")
    /bin/bash $SCRIPT
    exit;
fi


# Ensure that we are running in this scripts directory
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT") 
cd $SCRIPTPATH

# Load settings (environment variables)
source ../../settings/docker_settings.sh

IMAGE_NAME="`echo $REGISTRY`/`echo $PROJECT_NAME`"

# Copy the docker file up and run it in order to build the container.
# We need to move the dockerfile up so that it can easily add everything to the container.
cp -f Dockerfile ../../.
cd ../../.

# Ask the user if they want to use the docker cache
read -p "Do you want to use a cached build (y/n)? " -n 1 -r
echo ""   # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    docker build --pull --tag="$IMAGE_NAME" .
else
    docker build --pull --no-cache --tag="$IMAGE_NAME" .
fi

# clean up
rm Dockerfile

docker push $IMAGE_NAME

echo "Run the container with the following command:"
echo "bash deploy.sh"
