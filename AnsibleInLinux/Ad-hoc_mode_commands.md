note : in place of IP you can use any IP adress of target server or any group from hosts file.  
If asks sudo permissin use -b  

1. ping ,To check the health of remote servers ,  
    #ansible IP -m ping  
    (if we gety pong as reply from rempote server(s) ,they are up and can be used with ansible)

2.  file, to create/delete file/directory ,  
    #ansible IP -m file -a "path=enter_path state=directory" -b         (to create directory)  
  * #ansible IP -m file -a "path=enter_path state=absent" -b            (to delete directory)  
    #ansible IP -m file -a "path=enter_path state=touch" -b             (to create a file)  
    #ansible IP -m file -a "path=enter_path state=absent" -b             (to delete a file)  
     eg: #ansible IP -m file -a "path=/opt/deepu.txt state=touch owner=touch group=centos" -b    (you can many things like this ,which will be shown when you create a file)   
    ( -a means arguments, -b means become sudo user)  (path=enter_path (or) dest=enter_path)  
   

3. yum, to install or update or remove i.e delete a software/package,  
      #ansible IP -m yum -a "name=software_name state=latest"    
              state=latest is user for both installing and updating  
              state=present only for installing  
              state=absent to delete  
       eg: #ansible IP -m yum -a "name=httpd state=latest" 

4. service, to start,stop a service,  
      #ansible IP -m service -a "name=httpd state=started"   
      #ansible IP -m service -a "name=service_name state=stopped"    
      *to check status of service  

5. shell, to run shell script commands,  
      #ansible IP -m shell -a "cat /etc/groups"   

6. copy, to cpoy files/directory,  
     #ansible IP -m copy -a "src=source_path dest=destination_path"  
     *check if you can use the same for directory  

7. user, to delete or remove user,  
     #ansible IP -m user -a "name=deepu state=present"     (to create user)  
          state=absent (to delete user)  

8. group, to add or delete group,  
     #ansible IP -m group -a "name=employee state=present"       (state=absent to delete group)   

9. git ,  
     #ansible IP -m git -a "repo=GIT_URL dest=/opt/"    

10. setup , to know information about remote server,  
     #ansible IP -m setup  
    *#ansible IP -m setup "filter=ansible_distribution"  
    
