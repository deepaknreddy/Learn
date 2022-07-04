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
 (by default when you enter ,and give db it wilol show "test",test is schema)
 
 # To create collection
 >>db.createCollection("collection_name")

# to create user
use admin 
db.createUser({user:"<username>", pwd:"<password>", roles:[{role:"root", db:"admin"}]})
here admin is db name

# in /etc/mongod.conf
net:
  port: 27017   
  bindIp: 0.0.0.0
