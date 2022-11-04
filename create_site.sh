#!/bin/sh

# Define variables
#Path_available ="/etc/nginx/sites-available/$1"
#Path_nginx_conf ="/etc/nginx/nginx.conf"
# Create directory for site
sudo mkdir -p /var/www/$1/html
sudo chown -R $USER:$USER /var/www/$1
# Create index.html
echo "<h1>Welcome to $1</h1>"> /var/www/$1/html/index.html
# Create info.php
echo "<?php"> /var/www/$1/html/info.php
echo "phpinfo();">> /var/www/$1/html/info.php
# Create configuration file for site
sudo touch /etc/nginx/sites-available/$1
sudo chown $USER:$USER /etc/nginx/sites-available/$1
echo "server {"                                                                 >> /etc/nginx/sites-available/$1
echo "        listen 80;"                                                       >> /etc/nginx/sites-available/$1
echo "        root /var/www/$1/html;"                                           >> /etc/nginx/sites-available/$1
echo "        index index.php index.html index.htm index.nginx-debian.html;"    >> /etc/nginx/sites-available/$1
echo "        server_name $1 www.$1;"                                           >> /etc/nginx/sites-available/$1
echo ""                                                                         >> /etc/nginx/sites-available/$1
echo "        location / {"                                                     >> /etc/nginx/sites-available/$1
echo "                try_files "'$uri $uri'"/ =404;"                               >> /etc/nginx/sites-available/$1
echo "        }"                                                                >> /etc/nginx/sites-available/$1
echo ""                                                                         >> /etc/nginx/sites-available/$1
echo "        location ~ \.php$ {"                                              >> /etc/nginx/sites-available/$1
echo "                include snippets/fastcgi-php.conf;"                       >> /etc/nginx/sites-available/$1
#echo "                 #fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;"        >> /etc/nginx/sites-available/$1
echo "                 fastcgi_pass 127.0.0.1:9000;"                            >> /etc/nginx/sites-available/$1
echo "        }"                                                                >> /etc/nginx/sites-available/$1
echo ""                                                                         >> /etc/nginx/sites-available/$1
echo "        location ~ /\.ht {"                                               >> /etc/nginx/sites-available/$1
echo "                deny all;"                                                >> /etc/nginx/sites-available/$1
echo "        }"                                                                >> /etc/nginx/sites-available/$1
echo "}"                                                                        >> /etc/nginx/sites-available/$1
sudo chown root:root /etc/nginx/sites-available/$1
sudo ln -s /etc/nginx/sites-available/$1 /etc/nginx/sites-enabled/

#sudo chown $USER:$USER /etc/php/8.1/fpm/pool.d/www.conf
#Reemplazar
#;listen = /var/run/php5-fpm.sock
#listen = 127.0.0.1:9000
#cd /var/www/$1/html/
#sudo wget https://wordpress.org/latest.tar.gz
#sudo tar -xzvf latest.tar.gz
#cd wordpress/
#sudo mv * /var/www/$1/html/
#sudo mv * /var/www/sample1.test/html/