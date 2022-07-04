To install mongoDB https://github.com/deepaknreddy/Learn/blob/main/Linux/Installation/mongoDB/readme.md  
33
# check if it is started
#service mongod status 

# To enable authentication
#vi /etc/mongod.conf  
make the following changes 
security:  
 authorization: "enabled"                (space at the beginning is necessary, its yaml format) 
 
 ## Use mongo command to open mongodb
 #mongo
 
 # to create a DB
 >>use db_name       (the created db will be listed only after creating a collection in it)
 
 # to see which DB you are working on
 >>db
 
 # To create collection
 >>db.createCollection("collection_name")
