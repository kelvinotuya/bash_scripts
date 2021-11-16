#!/bin/bash

echo "#################################"
echo "Stoping HTTPD Server"
echo "#################################"
sudo systemctl stop httpd
echo 


echo "#################################"
echo "Removing webfiles from /var/www/html Directory"
echo "#################################"
sudo rm -rf /var/www/html/*
echo

echo "#################################"
echo "Uninstalling HTTPD, WGET, UNZIP, ZIP"
echo "#################################"
sudo yum remove httpd wget unzip zip -y
echo
echo "#################################"
echo "Completed..........Good Bye"
echo "#################################"


