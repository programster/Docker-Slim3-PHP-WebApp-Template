# Please do not manually call this file!
# This script is run by the docker container when it is "run"

# Run the apache process in the background
service apache2 start


# Put any startup tasks here!



# Start the cron service in the foreground
# We dont run apache in the FG, so that we can restart apache without container
# exiting.
cron -f
