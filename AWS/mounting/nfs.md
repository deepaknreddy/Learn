## nfs file sharing


### server-side  
sudo yum install nfs-utils -y  
sudo systemctl enable nfs-server  

attach the volume to the ec2-instance in aws  

lsblk  
file -s /dev/xvdf  
mkdir /sharedir  
mount /dev/xvdf /sharedir  
chmod 777 /sharedir  
vi /etc/exports  
     /sharedir <clientIP>(rw,sync)  
service nfs restart  
showmount -e (to check of it is exported)  

enable 2049 port in security group inbound rules



###client-side  
sudo yum install nfs-utils -y  
 mkdir /newdir  
mount -t nfs 44.211.39.77:/sharedir /newdir  
