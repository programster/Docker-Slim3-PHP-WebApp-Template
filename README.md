# Docker Slim3 PHP7.1 WebApp Template

A template to build websites using PHP 7.1 with Debian 8 docker containers. This currently uses the [slim framework](http://www.slimframework.com/) version 3.

### Usage

```bash
# Clone this repo
git clone https://github.com/programster/Docker-Slim3-PHP7.1-WebApp-Template.git

# Use composer to pull the slim framework
cd Docker-Slim3-PHP7.1-WebApp-Template/app
composer update

# Create the .env file from the template file
# be sure to review its settings and fill in appropriately.
cp .env.tmpl .env


# Build and deploy the docker container.
cd ../docker
bash build.sh
bash deploy.sh
```

### Dev Deployment
Whilst developing your application, you can make use of the `dev-deploy.sh` script instead
of the `deploy.sh` script. The difference is that your container will load your files through a 
volume. Thus your changes are reflected immediately and you do not have to keep rebuilding and 
re-deploying your docker container.

### Private docker registry
Click [here](http://blog.programster.org/2015/03/17/run-your-own-private-docker-registry/) to find out how to deploy your own private docker registry in under a minute.
