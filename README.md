Some [Node.js](https://github.com/vercel/next-learn/tree/master/basics/demo) sample for future me to run on VM.

Run [Next.js](https://nextjs.org/learn) demo page on Google Cloud Platform (GCP) virtual machine (VM).

Just:

    git clone https://github.com/linas-p/next-learn-basics-demo
    
    cd next-learn-basics-demo

    ./script_page.sh

Steps:

1. Create VM on GCP
2. Install new Nodejs (remove old if exist):

        cd /etc/apt/sources.list.d
        sudo rm nodesource.list

        sudo apt --fix-broken install
        sudo apt remove nodejs libnode-dev libnode72
        sudo apt remove nodejs-doc

        curl -sL https://deb.nodesource.com/setup_18.x | sudo bash -
        sudo apt update
        sudo apt-get install nginx nodejs git vim 
3. Prep nginx:

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
4. Build some demo page:

        npm install next start 
        # npm install @emotion/server @mui/icons-material # additional if needed
        npm run build 
5. Run and deatach:

        screen -S start_session
        npm run start 
        <ctrl>+a+d
6. Check VM global IP
