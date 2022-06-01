#!/bin/bash
cd /opt
sudo yum install wget unzip
sudo wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.0.21/bin/apache-tomcat-10.0.21.zip
sudo unzip apache-tomcat-10.0.21.zip
sudo rm -rf apache-tomcat-10.0.21.zip
