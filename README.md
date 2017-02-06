# Docker Slim3 PHP7.1 WebApp Template

A template to build websites using PHP 7.1 with Debian 8 docker containers. This currently uses the [slim framework](http://www.slimframework.com/) version 3.

### Usage

```
# Clone this repo
git clone https://github.com/programster/Docker-Slim3-PHP7.1-WebApp-Template.git

# Use composer to pull the slim framework
cd docker-php-website-template/project
composer update

# Edit the content of the docker_settings.php in the settings folder
# and point it to your own private docker registry.
# CHange the VIRTUAL_HOST and the PROJECT_NAME whilst you're at it.

# Build the container and run it.
cd docker
bash build.sh
bash deploy.sh
```

### Private docker registry
Click [here](http://blog.programster.org/2015/03/17/run-your-own-private-docker-registry/) to find out how to deploy your own private docker registry in under a minute.
