#!/bin/bash
sudo service httpd stop
sudo yum install git -y
cd /opt
sudo rm -rf REPO_NAME
sudo git clone REPO_GIT_URL
sudo rm -rf /var/www/html/*
sudo cp -r REPO_NAME/* /var/www/html/
sudo service httpd start
