USE: To perform task(s) on n number of servers with ease .

To install Ansible https://github.com/deepaknreddy/Learn/blob/main/Linux/Installation/ansible .

Ansibe is used for configure management, provision the underlying infrastructure of the environment etc. 

For example if you wanty to create a user, set password and install tomcat on n number of servers ,you can do it with a single playbook or with a few ansible adhoc commands easily and quickly.   

If you want to create a backup of a file name, eg deepu.txt , save it as deepu.txt.bak so you know its a backup file . ( .bak is used as extension for backup file )  
The default path for ansible is /etc/ansible/ , you can change the default poath in /ansible/ansible.cfg   

In /etc/ansible/ , by default we have 2 files ( ansible.cfg, hosts ) , and a folder (roles) .  

When we install ansible we make following changes in ansible.cfg file ,  
     Remove # from the comments and change then,  
       1. sudo_user=     (may be the user which we have on remote server with sudo permission must)  
       2. host_key_checking= False ( 'T' and 'F' must be capital for True and False )  
       3. remote_user=   (can be same as above)  
       4. private_key_file=                   (the path of private key file [ id_rsa ] ,who's corresponding public key is placed on the remote servers)   

/etc/ansible/hosts file is also called as inventory  
Before we make any changes in the hosts file we create a backup of it , #cp hosts hosts.bak    

Lets start simple,    
  1. delete everything in hosts file   
  2. add the public IP of the target servers line by line  
  3. you can group the IPs by following syntax  
          [dev]      #(can be any name)        
          IP1  
          IP2  
          [master]   #(can be any name)      
          IP3  
          IP4  
  4. you can have children group under a parent group with the following syntax ,  
          [production: children]    #( production is parent group name)  
          dev   
          master     #(master and dev are children groups which were created earlier)   
          
Like how we have plugins in Jenkins , we have modules in Ansible ,   it is represented by -m command .  

## Commands in Ansible :  
In Ansible we can run commands in 3 modes :  
     1. Ad-hoc mode ( with ansible IP -m ... )  
     2. Playbook    ( with ansible-playbook play_book_name )    
     3. Roles     
     
