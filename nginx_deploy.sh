sudo service nginx stop
sudo rm -rf /usr/share/nginx/html/*
cd /opt
sudo yum install git -y
sudo git clone REPO_GIT_URL
sudo cp REPO_NAME/* /usr/share/nginx/html/
sudo service nginx start
