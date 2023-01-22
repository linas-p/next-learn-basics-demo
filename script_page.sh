#!/bin/bash

# Prep Nodejs deps on ubuntu VM

# Install newest nodejs in this case 18
sudo rm /etc/apt/sources.list.d/nodesource.list
sudo apt remove -y nodejs libnode-dev libnode72
sudo apt remove -y nodejs-doc

curl -sL https://deb.nodesource.com/setup_18.x | sudo bash -
sudo apt update
sudo apt-get install -y nginx nodejs git vim 

# Prep nginx host

NGINX_='server {
    listen 80;
    client_max_body_size 10M;
    server_name YourWebsiteNameWithDomain yourIPV4;
    location / {
        proxy_pass http://127.0.0.1:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
     }
}' 

echo $NGINX_ | sudo tee /etc/nginx/sites-available/default

sudo nginx -t 
sudo systemctl restart nginx

npm install next start 

npm run build 
npm run start 
