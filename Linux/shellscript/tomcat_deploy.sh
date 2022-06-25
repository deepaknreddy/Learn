## use this if tomcat is downloaded manually via wget grom website
sudo tomcatdown  #or whatever softlink name u have given
cd /opt
sudo rm -rf TOMCAT_DIRECTORY/webapps/THE.war_FILE
sudo yum install git -y
sudo rf -rf REPO_NAME
sudo git clone REPO_URL_LINK
sudo yum install epel-release -y
sudo yum install maven -y
cd REPO_NAME
sudo mvn clean
sudo mvn package  #asuming everything in validate,compile,test went good
sudo cp target/THE.warFILE /opt/TOMCAT_DIRECTORY/webapps/
sudo tomcatup



## if tomcat is downloaded from yum
#sudo service tomcat stop
#sudo rm -rf /var/lib/tomcat/webapps/THE.warFILE       (or)     sudo rm -rf /user/share/tomcat/webapps/THE.warFILE   (this is soft link for the webapps directory in /var/lib/tomcat / )
# [ STEPS FROM ABOVE METHOD- the cloning and maven]
#sudo cp /opt/REPO_NAME/target/THE.warFILE /user/share/tomcat/
#sudo service tomcat start
