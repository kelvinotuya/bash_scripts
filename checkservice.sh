#!/bin/bash
echo "###########################################"
date
 
# ls /var/run/httpd.pid &> /dev/null
echo "Checking is service is running"
##########################################
## pgrep exsmple ##
###########################################
pgrep -x httpd > /dev/null && echo "Process Found" || echo "Process not found"
pgrep -x mysqld > /dev/null && echo "Process Found" || echo "process not found"

############################################
## pidof example  ##
############################################
# pidof httpd > /dev/null && echo "Service if running" || echo "Service NOT running"
# pidof mysqld > /dev/null && echo "Service if running" || echo "Service NOT running"
# pidof nginx > /dev/null && echo "Service if running" || echo "Service NOT running"

############################################

############################################
## ps example  ##
############################################
# ps -C httpd > /dev/null && echo "Service if running" || echo "Service NOT running"
# ps -C mysqld > /dev/null && echo "Service if running" || echo "Service NOT running"
# ps -C nginx > /dev/null && echo "Service if running" || echo "Service NOT running"

############################################

if [$? -eq 0]
then 
    echo "Httpd process is running..."
else 
    echo "httpd process is not Running, "
    echo "Starting the process"
    systemctl start httpd
    if [$? -eq 0]
    then
	echo "Process started successfully"
    else
	echo "Process Starting Failed, contact the admin"
    fi
fi
echo " ###########################################"
echo
