1. lets say we need 2 different versions of maven for 2 different jobs/project,  
        i. maven 3.8.4 for 1 project  
       ii. maven 2.6.4 for another project  
    at this time we cant directly install maven on our jenkins server and run, we will configure maven in our jenkins server i.e. in jenkins UI.
   
   do to so,  
     open http://IP:8080 >> dashboard >> manage jenkins >> global tool configuration >> maven (not maven configuration) >> add maven >> select the maven version (3.8.4) , add maven : select maven version (3.6.4) >> save  (it will install within jenkins not accessible in linux) (that maven will be downloaded to /var/lib/jenkins/tools only if they are used in a ny job)
   
   now , configure the job,(in a free style job) select build as invoke top-level maven, there select the mvaen version and under goals specify maven commands like:
```
clean package
```
3.  sonar qube details can be given in ```pom.xml```, there specify sonarqube server url and sonar token .
  And to use sonar in the same free stype project:
           configure the job,(in a free style job) select build as invoke top-level maven, there select the maven version and under goals specify maven commands like:
```
clean package sonar:sonar
```
save it.

4. all the tools installed via global tool configuration, are downloaded and stored in ```/var/lib/jenkins/tools/ ``` 

5. jenkins secrets are stored under ```/var/lib/jenkins/secrets/ ``` 
   initial password is stored in ```/var/lib/jenkins/secrets/initialAdminPassword```

6. plugins are stored in ```/var/lib/jenkins/plugins/```

7. to configure nexus to the same freetyle job:   
   go to ```/var/lib/jenkins/tools/hudson.tasks.MavenInstallation/``` there open the ``selected maven version for the project```,```cd conf/``` under ``<servers>``` block in ```settings.xml``` (here the credentials are configured)(to add/configure the reposiroty, it is done in pom.xml)   
        now configure the goal for invoke top-level maven in the job to,
           ```
   clean package sonar:sonar deploy
   ``` 

9. now to deploy the same project/job as a .war to  a tomcat server in freestle job,(tomcat is running on an another server)  
    install ```deploy to container plugin```  
    configure the job, under ```post build actions``` select ```deploy war/eat to a container```,  
           there under war/ear files give war filename ``` **/Webapp.war (or we can also give relative path,refer deploy war/ear to container plugin in jenkins.io```  , for context path give it if needed, then add container >> select ```the version of tomcat server``` and select tomcat credentials which are saved and give tomcat url ```http://IP:8080/``` >> save  
        if this has to work then the tomcat user should have ```manager-script``` role attached in ```/opt/tomcat/conf/tomcat-users.xml``` 
10.
