# docker-php-website-template
A template to kick off a dockerized website built in PHP. This currently uses the [slim framework](http://www.slimframework.com/)

### Usage

```
# Clone this repo
git clone https://github.com/programster/docker-php-website-template.git

# Use composer to pull the slim framework
cd docker-php-website-template/project
composer update

# Edit the content of the docker_settings.php in the settings folder
# and point it to your own private docker registry.
# CHange the VIRTUAL_HOST and the PROJECT_NAME whilst you're at it.

# Build the container and run it.
cd docker
bash build.sh
bash run-container.sh
```

### Private docker registry
Click [here](http://blog.programster.org/2015/03/17/run-your-own-private-docker-registry/) to find out how to deploy your own private docker registry in under a minute.
