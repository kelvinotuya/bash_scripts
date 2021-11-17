installing Dependencies
echo "##########################################################
echo " Installing packages  "
echo "##########################################################
sudo yum install wget unzip zip httpd -y # > /dev/null
echo 

# Start & Enable Service
echo "##########################################################"
echo " Start & Enable HTTPD Service "
echo "##########################################################"
systemctl start httpd
systemctl enable httpd
echo

echo "##########################################################"
echo" creating tempoary  Directory"
echo "##########################################################"
mkdir -p /tmp/webfiles
cd /tmp/webfiles
echo

wget https://www.tooplate.com/zip-templates/2106_soft_landing.zip # > /dev/null
unzip 2106_soft_landing.zip                        
sudo cp -r 2106_soft_landing/* /var/www/html/                 
 

echo "##########################################################"
echo "Restarting HTTPD Service "
echo "##########################################################"
systemctl restart httpd 
echo 

#Clean Up
echo "##########################################################"
echo "Clean up"
echo "##########################################################"
rm -rf /tmp/webfiles
