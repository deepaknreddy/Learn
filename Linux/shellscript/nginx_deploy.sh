#!/bin/bash
sudo service nginx stop
sudo rm -rf /usr/share/nginx/html/*
cd /opt
sudo rm -rf REPO_NAME
sudo yum install git -y
sudo git clone REPO_GIT_URL
sudo cp REPO_NAME/* /usr/share/nginx/html/
sudo service nginx start
