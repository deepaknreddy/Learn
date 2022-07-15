#!bin/bash
sudo yum install wget -y
sudo yum install java -y 
cd /opt
sudo wget https://dlcdn.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.tar.gz
sudo yum install gzip gunzip tar -y 
sudo gunzip apache-maven-3.8.6-bin.tar.gz
sudo tar -xvf apache-maven-3.8.6-bin.tar
sudo rm -rf apache-maven-3.8.6-bin.tar
sudo ln -s /opt/apache-maven-3.8.6/bin/mvn /usr/bin/mvn
mvn --version
