#!/bin/bash

 sudo apt-get update
 sudo apt install -y nginx
 sudo systemctl start nginx
 
sudo usermod -aG root ubuntu
sudo chmod -R 775 /var/www/html
