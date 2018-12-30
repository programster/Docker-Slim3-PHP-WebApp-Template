# Due to layout of this project, the dockerfile will be moved up two directories and run during
# the build. Thus when performing any ADD commands, remember that this is "where you are"

FROM ubuntu:18.04

# Don't prompt for timezone etc.
env DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get dist-upgrade -y

RUN apt update
RUN apt install php7.2 -y



# Install the relevant packages
RUN apt-get install -y vim apache2 php7.2-cli php7.2-mysql curl php7.2-curl

# Enable the php mod we just installed
RUN a2enmod php7.2
RUN a2enmod rewrite


# expose port 80 and 443 (ssl) for the web requests
EXPOSE 80
EXPOSE 443

# Manually set the apache environment variables in order to get apache to work immediately.
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

# It appears that the new apache requires these env vars as well
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2/apache2.pid


###### Update the php INI settings #########

# Uncomment any of these if you need them.

# Increase php's max allowed memory size
#RUN sed -i 's;memory_limit = .*;memory_limit = -1;' /etc/php5/apache2/php.ini
#RUN sed -i 's;memory_limit = .*;memory_limit = -1;' /etc/php5/cli/php.ini

#RUN sed -i 's;display_errors = .*;display_errors = On;' /etc/php5/apache2/php.ini
#RUN sed -i 's;display_errors = .*;display_errors = On;' /etc/php5/cli/php.ini


# Set the max execution time
#RUN sed -i 's;max_execution_time = .*;max_execution_time = -1;' /etc/php5/apache2/php.ini
#RUN sed -i 's;max_execution_time = .*;max_execution_time = -1;' /etc/php5/cli/php.ini

# This is also needed for execution time
#RUN sed -i 's;max_input_time = .*;max_input_time = -1;' /etc/php5/apache2/php.ini


# Install the cron service to tie up the container's foreground process
RUN apt-get install cron -y

# Add our websites files to the default apache directory (/var/www)
# This should be as late as possible in the dockerfile to speed up rebuilds
ADD settings /var/www/my-site/settings
ADD project /var/www/my-site/project

# Update our apache sites available with the config we created
ADD project/docker/apache-config.conf /etc/apache2/sites-enabled/000-default.conf

# Use the crontab file.
# The crontab file was already added when we added "project"
RUN crontab /var/www/my-site/project/docker/crons.conf

# Execute the containers startup script which will start many processes/services
# The startup file was already added when we added "project"
CMD ["/bin/bash", "/var/www/my-site/project/docker/startup.sh"]
