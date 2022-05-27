#!/bin/bash

echo "hello mate"
echo "Be patient we are hosting your website"
sleep 3

# Install configration
sudo apt update
sudo apt upgrade

sudo apt install apache2 -y

#enabling apache
echo "Checking the apache status....."
systemctl status apache

sudo systemctl is-enabled apache2
sudo systemctl restart apache2

echo "setting up the website data"
cd /var/www/html
sudo rm -rf index.html

echo "cloning you website from git hub"
sleep 2
sudo git clone https://github.com/a-iftikhar/food
sudo cp -r /var/www/html/food/* .
sudo rm -rf food/
echo "website cloned"
#cd /etc/apache2/sites-available
#sudo touch page.conf

sudo cp /etc/apache2/sites-available/000-default.conf  /etc/apache2/sites-available/page.conf
sudo sed -i -e 's/#ServerName www.example.com/ServerName www.food.com/'  /etc/apache2/sites-available/page.conf
sudo sed -i -e 's/ServerAdmin webmaster@localhost/ServerAdmin abdullah@bbb.com/' /etc/apache2/sites-available/page.conf
sudo a2dissite 000-default.conf
sudo a2ensite page.conf

echo "Reloding your apache server........"

sudo systemctl restart apache2

echo "Getting things Done...."
sleep 3

sudo systemctl restart apache2
echo
echo "192.168.6.128  www.food123.com " >> /etc/hosts
echo 
echo
echo "Access you website using the ip:192.168.6.128 " 
