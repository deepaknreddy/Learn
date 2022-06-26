USE: To perform task(s) on n number of servers with ease .

To install Ansible https://github.com/deepaknreddy/Learn/blob/main/Linux/Installation/ansible .

Ansibe is used for configure management, provision the underlying infrastructure of the environment etc. 

For example if you wanty to create a user, set password and install tomcat on n number of servers ,you can do it with a single playbook or with a few ansible adhoc commands easily and quickly.
If you want to create ackup of a file name, eg deepu.txt , save it as deepu.txt.bak so you know its a backup file . ( .bak is used as extension for backup file )
The default path for ansible is /etc/ansible/ , you can change the default poath in /ansible/ansible.cfg 
In /etc/ansible/ , by default we have 2 files ( ansible.cfg, hosts ) , and a folder (roles) .
When we install ansible we make following changes in ansible.cfg file ,
     1.
