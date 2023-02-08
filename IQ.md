# OSI model  
* The Open Systems Interconnection (OSI) model describes seven layers that computer systems use to communicate over a network.  
* OSI 7-layer model is still widely used, as it helps visualize and communicate how networks operate, and helps isolate and troubleshoot networking problems.  
![image](https://user-images.githubusercontent.com/104769185/217046137-7e1b111e-a978-4e78-9c32-76041bd8ff32.png)  
# ELB  
* 1. application load balencer (layer 7 -application layer)  
  2. network load balancer  (layer 4 - transport layer)   
  3. gateway loadbalancer  
## appliation load balancer:  
target group: Target groups route requests to one or more registered targets, such as EC2 instances, using the protocol and port number that you specify.  
              targets cab be:    
listeners:  
rules:    
      rules types:
      sticky session:  
      
## network loadbalancer:

# auto-scaling:
(create load balncer b4 creating auto-scaling, although it allows us to crreate loadbalancewr while creating auto-scaling)
launch configuration: (no service-support sice dec 2022)    
launch templete:  
rules:  
# VPC:


# EBS:

# S3:

# lambda:  




# Linux
- Find a word in a specific file ??
    grep keyword filename
- We have lot of files inside a /root folder. Find a file which is containig a perticular word??
    grep -Rw /root -e keyword
- Replace a word in a pericular file ??
    sed -i 's/original_word/new_word/g' filename
- Replace a word with first occurence in a file ??
    sed -z 's/original_word/new_word/1' filename
- Find a perticular file in folder-inside-folder ??
    find path -type filename
- Find a file with less a than 2mb size && greter than 5mb size??
    (wrong) find path -type f -size -2M +5M
- find files that have a modification time of a day ago ??
    (no complete) find path -type f -mtime -
- Find a Directory with a specific name ??
    find path -type d -name directory_name
- How to add a line of code in the existing file (No need to effect the existing code in the same file) ??
     cat >> filename  
     or  
     echo "new line" >> filename  
- List out top 5 CPU consuming proesses ??
    top --sort -%cpu | head -5
- Check a process is running howmuch long ??
    pidof procee_name           (will give process id)
    ps -p processid -o etime         (will give time sinse the rpocess is sunning)
    
- diff b/w $* and $& ??
    $* stores all the arguments that were entered on the command line
    (incomplete) $& 
- Exclude a String in a file and print ??
    grep -v keyword filename
- zip and tar a file ?? unzip a zip/tar file??
    tar -cvf destination.tar source
    zip source.tarfile destination
    
    unzip source.tar
    tar -xvf file.tar
- Find the modified files in specified time ??
    (incomplete)
- Count number lines a file??
    nl filename      (will print all the line wiuth numbering)
    wc -l filename    (will print numer of lines)
- Find the last 10 recent logs ??
    (incomplete)
- Print second word of every line ??
    awk '{print $2}' filename
- Find number of CPU cores prasent in Servers ??? //nproc or cat /proc/cpuinfo ??
    cat /proc/cpuifo
