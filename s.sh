#!/bin/bash
echo "Updating VM"
sudo apt-get -y update
apt-get install git -y

echo "Installing Apache2 and PHP5"
sudo apt-get -y install apache2 php5 libapache2-mod-php5
echo "Installing MYSQL"
sudo apt-get install debconf-utils -y
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password 1234"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password 1234"
sudo apt-get install -y mysql-server

sudo mkdir -p /var/www/test.ba/public_html
sudo chmod -R 755 /var/www
sudo chown -R $USER:$USER /var/www/test.ba/public_html
sudo cp -r /var/www/src/* /var/www/test.ba/public_html/
sudo cp /var/www/prov/test.ba.conf /etc/apache2/sites-available/
sudo a2ensite test.ba.conf
sudo service apache2 reload
sudo service apache2 restart
