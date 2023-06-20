1. lets say we need 2 different versions of maven for 2 different jobs/project,  
        i. maven 3.8.4 for 1 project  
       ii. maven 2.6.4 for another project  
    at this time we cant directly install maven on our jenkins server and run, we will configure maven in our jenkins server i.e. in jenkins UI.  
   do to so,  
     open http://IP:8080 >> dashboard >> manage jenkins >> global tool configuration >> maven (not maven configuration) >> add maven >> select the maven version (3.8.4) , add maven : select maven version (3.6.4) >> save  
   now , configure the job,(in a free style job) select build as invoke top-level maven, there select the mvaen version and under goals specify maven commands like: clean package
   
2. 
