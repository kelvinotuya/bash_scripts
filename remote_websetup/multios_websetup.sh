#!/bin/bash

#Variable Declaration
PACKAGE="httpd wget unzip"
SVC="httpd"
URL='https://www.tooplate.com/zip-templates/2106_soft_landing.zip'
ARTIFACT='2106_soft_landing.zip'
TEMPDIR="/tmp/webfiles"

# Check for OS
yum --help &> /dev/null

if [$? -eq 0]
then
    PACKAGE="httpd wget unzip"
    SVC="httpd"

    echo "Running Setup on CentOS"
#installing Dependencies
echo "##########################################################
echo " Installing packages  "
echo "##########################################################
sudo yum install $PACKAGE -y  > /dev/null
echo 

# Start & Enable Service
echo "##########################################################"
echo " Start & Enable HTTPD Service "
echo "##########################################################"
systemctl start $SVC
systemctl enable $SVC
echo

echo "##########################################################"
echo" creating tempoary  Directory"
echo "##########################################################"
mkdir -p $TEMPDIR
cd $TEMPDIR
echo

wget $URL > /dev/null
unzip $ARTIFACT            
sudo cp -r $ARTIFACT/* /var/www/html/                  
 

echo "##########################################################"
echo "Restarting HTTPD Service "
echo "##########################################################"
systemctl restart httpd 
echo 

#Clean Up
echo "##########################################################"
echo "Clean up"
echo "##########################################################"
rm -rf $TEMPDIR
echo

sudo systemctl status $SVC
ls /var/www/html

else

PACKAGE="apache2 wget unzip"
    SVC="apache2"

    echo "Running Setup on CentOS"
#installing Dependencies
echo "##########################################################
echo " Installing packages  "
echo "##########################################################
sudo apt update
sudo apt install $PACKAGE -y  > /dev/null
echo 

# Start & Enable Service
echo "##########################################################"
echo " Start & Enable HTTPD Service "
echo "##########################################################"
systemctl start $SVC
systemctl enable $SVC
echo

echo "##########################################################"
echo" creating tempoary  Directory"
echo "##########################################################"
mkdir -p $TEMPDIR
cd $TEMPDIR
echo

wget $URL > /dev/null
unzip $ARTIFACT                        
sudo cp -r $ARTIFACT/* /var/www/html/                 
 

echo "##########################################################"
echo "Restarting HTTPD Service "
echo "##########################################################"
systemctl restart httpd 
echo 

#Clean Up
echo "##########################################################"
echo "Clean up"
echo "##########################################################"
rm -rf $TEMPDIR
echo

sudo systemctl status $SVC
ls /var/www/html

fi
