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
 
       (no complete) find path -type f -mtime 1  
        find path -mtime +1 -type f    (find files that are modified more than 1 day)  
        find path -mtime -1 -type f    (find files that are modified less than a day ago)  
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

          (incomplete) find path -mtime +time_in_days  
- Count number lines a file??  

          nl filename      (will print all the line wiuth numbering)  
          wc -l filename    (will print numer of lines)  
- Find the last 10 recent logs ??  

      (incomplete)
- Print second word of every line ??  

        awk '{print $2}' filename
- Find number of CPU cores prasent in Servers ??? //nproc or cat /proc/cpuinfo ??  

        cat /proc/cpuifo
- Check If a Process is Running ?? If not Make it Run otherwise "Print Process is Running" ??

        #!/bin/bash
        service_name= process_name
        if (( $( ps -ef | grep -v grep | grep $service_name | wc -l) > 0 ))
        then 
        echo "$service is running!!!"
        else
        /etc/init.d/$service start
        fi
        
        or 
        
        	#!/bin/bash
          ps -ef | grep -v grep | grep nginx
          if [ $? -eq 1 ]
          then
          echo " Httpd is Stopped !! We are starting the service now"
          sudo service httpd restart
          else
          echo "still running"
          fi
          
- Delete files older than 10 days using shell script in Unix [duplicate] ??  

          find path -mtime +10 -type d | xargs rm -rf 
- Compress/ZIP older than 20 days logs of Apache ??

          (incomplete) find path -mtime +20 -type f | 
- What is the use of  $? , $* , $0 , $# , $@ , $$ , $! and expline with simple program?

            (incomplete)
- Write a shell scripting program to print biggest number in given three values. [a=3 , b =9, c=4]

            (not sure if it works)
            #!/bin/bash
            a=3
            b=9
            c=4
            i=0
            for i in a, b, c
            do 
              if [[ i> big ]]
              then
                  big = i
              fi
            done

- Shell Script to get exception from logs for last one hour

	 grep "^$(date -d -1hour +'%Y-%m-%d %H')" test.logs | grep 'exception'  (copy-pasted)  
remaining in devops/linux/ in learnwithdevops
