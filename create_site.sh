#!/bin/bash
# Create directory for site
sudo mkdir -p /var/www/$1/html
sudo chown -R $USER:$USER /var/www/$1
# Create index.html
echo "<h1>Welcome to $1</h1>"> /var/www/$1/html/index.html
# Create configuration file for site
sudo echo "server {"                                                    >> /etc/nginx/sites-available/$1
sudo echo "        listen 80;"                                          >> /etc/nginx/sites-available/$1
sudo echo "        listen [::]:80;"                                     >> /etc/nginx/sites-available/$1
sudo echo ""                                                            >> /etc/nginx/sites-available/$1
sudo echo "        root /var/www/$1/html;"                              >> /etc/nginx/sites-available/$1
sudo echo "        index index.html index.htm index.nginx-debian.html;" >> /etc/nginx/sites-available/$1
sudo echo ""                                                            >> /etc/nginx/sites-available/$1
sudo echo "        server_name $1 www.$1;"                              >> /etc/nginx/sites-available/$1
sudo echo ""                                                            >> /etc/nginx/sites-available/$1
sudo echo "        location / {"                                        >> /etc/nginx/sites-available/$1
sudo echo "                try_files $uri $uri/ =404;"                  >> /etc/nginx/sites-available/$1
sudo echo "        }"                                                   >> /etc/nginx/sites-available/$1
sudo echo "}"                                                           >> /etc/nginx/sites-available/$1
