#!/bin/bash
cd /opt
sudo yum install wget unzip -y
sudo wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.0.21/bin/apache-tomcat-10.0.21.zip
sudo unzip apache-tomcat-10.0.21.zip
sudo rm -rf apache-tomcat-10.0.21.zip
cd apache-tomcat-10.0.21/bin/
sudo chmod u+x catalina.sh shutdown.sh  startup.sh
sudo ln -s /opt/apache-tomcat-10.0.21/bin/startup.sh /usr/bin/tomcatup
sudo yum install java -y
sudo ln -s /opt/apache-tomcat-10.0.21/bin/shutdown.sh /usr/bin/tomcatdown
sudo sed -i 's/8080/8081/g' /opt/apache-tomcat-10.0.21/conf/server.xml        #to change port associated with tomcat from 8080 to 8081 
sudo tomcatup
