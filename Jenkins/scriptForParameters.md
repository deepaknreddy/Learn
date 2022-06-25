# username is string parameter, branchname is choice parameter, deploy is boolean parameter

echo "	STARTING TO BUILD"
if [ deploy ];
then
 
    if [ $branchname == 'development' ];
    then
        echo "$username $branchname"
	    ssh -o StrictHostKeyChecking=no deepu@13.232.205.65  ' sudo service nginx stop && sudo rm -rf /usr/share/nginx/html/* && cd /opt/ && sudo rm -rf static-website-j1 && sudo yum install git -y && sudo git clone                https://github.com/deepaknreddy/static-website-j1.git && sudo cp -r static-website-j1/* /usr/share/nginx/html/ && sudo service nginx start '
    else
        echo "$username $branchname"
        ssh  -o StrictHostKeyChecking=no deepu@13.127.96.245 ' sudo service nginx stop && sudo rm -rf /usr/share/nginx/html/* && cd /opt/ && sudo rm -rf static-website-j1 && sudo yum install git -y && sudo git clone --branch master https://github.com/deepaknreddy/static-website-j1.git && sudo cp -r static-website-j1/* /usr/share/nginx/html/ && sudo service nginx start '
    fi
  
else
   echo "NOT DEPLOYING"
fi
