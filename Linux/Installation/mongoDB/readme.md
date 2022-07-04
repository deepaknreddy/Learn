# 1. Create a .repo file 
vi /etc/yum.repos.d/mongodb.repo  

# 2. Paste the following into mongodb.repo
[mongodb-org-4.4]  
name=MongoDB Repository  
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.4/x86_64/  
gpgcheck=1  
enabled=1  
gpgkey=https://www.mongodb.org/static/pgp/server-4.4.asc  

# 3. Install 
#yum install mongodb-org -y

# 4. start mongod
#service start mongod
