#!bin/bash
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key    #key will be placed/copied to /var/lib/jenkins/secrets/initialAdminPassword
sudo yum install fontconfig java-11-openjdk -y  #remember to change alternatives to this version of java as default then restart jenkins
sudo yum install jenkins -y
sudo service jenkins start
