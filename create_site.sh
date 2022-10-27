#!/bin/sh

# Define variables
#Path_available ="/etc/nginx/sites-available/$1"
#Path_nginx_conf ="/etc/nginx/nginx.conf"
# Create directory for site
sudo mkdir -p /var/www/$1/html
sudo chown -R $USER:$USER /var/www/$1
# Create index.html
echo "<h1>Welcome to $1</h1>"> /var/www/$1/html/index.html
# Create configuration file for site
sudo touch /etc/nginx/sites-available/$1
sudo chown $USER:$USER /etc/nginx/sites-available/$1
echo "server {"                                                    >> /etc/nginx/sites-available/$1
echo "        listen 80;"                                          >> /etc/nginx/sites-available/$1
echo "        listen [::]:80;"                                     >> /etc/nginx/sites-available/$1
echo ""                                                            >> /etc/nginx/sites-available/$1
echo "        root /var/www/$1/html;"                              >> /etc/nginx/sites-available/$1
echo "        index index.html index.htm index.nginx-debian.html;" >> /etc/nginx/sites-available/$1
echo ""                                                            >> /etc/nginx/sites-available/$1
echo "        server_name $1 www.$1;"                              >> /etc/nginx/sites-available/$1
echo ""                                                            >> /etc/nginx/sites-available/$1
echo "        location / {"                                        >> /etc/nginx/sites-available/$1
echo "                try_files $uri $uri/ =404;"                  >> /etc/nginx/sites-available/$1
echo "        }"                                                   >> /etc/nginx/sites-available/$1
echo "        location ~ \.php$ {"                                 >> /etc/nginx/sites-available/$1
echo "                include snippets/fastcgi-php.conf;"          >> /etc/nginx/sites-available/$1
echo "           #fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;" >> /etc/nginx/sites-available/$1
echo "		          fastcgi_pass 127.0.0.1:9000;"                >> /etc/nginx/sites-available/$1
echo "        }"                                                   >> /etc/nginx/sites-available/$1
echo "}"                                                           >> /etc/nginx/sites-available/$1
sudo chown root:root /etc/nginx/sites-available/$1

sudo ln -s /etc/nginx/sites-available/$1 /etc/nginx/sites-enabled/


echo "user www-data;"                                                           > /etc/nginx/nginx.conf
echo "worker_processes auto;"                                                   >> /etc/nginx/nginx.conf
echo "pid /run/nginx.pid;"                                                      >> /etc/nginx/nginx.conf
echo "include /etc/nginx/modules-enabled/*.conf;"                               >> /etc/nginx/nginx.conf
echo ""                                                                         >> /etc/nginx/nginx.conf
echo "events {"                                                                 >> /etc/nginx/nginx.conf
echo "        worker_connections 768;"                                          >> /etc/nginx/nginx.conf
echo "        # multi_accept on;"                                               >> /etc/nginx/nginx.conf
echo "}"                                                                        >> /etc/nginx/nginx.conf
echo ""                                                                         >> /etc/nginx/nginx.conf
echo "http {"                                                                   >> /etc/nginx/nginx.conf
echo ""                                                                         >> /etc/nginx/nginx.conf
echo "        ##"                                                               >> /etc/nginx/nginx.conf
echo "        # Basic Settings"                                                 >> /etc/nginx/nginx.conf
echo "        ##"                                                               >> /etc/nginx/nginx.conf
echo ""                                                                         >> /etc/nginx/nginx.conf
echo "        sendfile on;"                                                     >> /etc/nginx/nginx.conf
echo "        tcp_nopush on;"                                                   >> /etc/nginx/nginx.conf
echo "        types_hash_max_size 2048;"                                        >> /etc/nginx/nginx.conf
echo "        # server_tokens off;"                                             >> /etc/nginx/nginx.conf
echo ""                                                                         >> /etc/nginx/nginx.conf
echo "        server_names_hash_bucket_size 64;"                                >> /etc/nginx/nginx.conf
echo "        # server_name_in_redirect off;"                                   >> /etc/nginx/nginx.conf
echo ""                                                                         >> /etc/nginx/nginx.conf
echo "        include /etc/nginx/mime.types;"                                   >> /etc/nginx/nginx.conf
echo "        default_type application/octet-stream;"                           >> /etc/nginx/nginx.conf
echo ""                                                                         >> /etc/nginx/nginx.conf
echo "        ##"                                                               >> /etc/nginx/nginx.conf
echo "        # SSL Settings"                                                   >> /etc/nginx/nginx.conf
echo "        ##"                                                               >> /etc/nginx/nginx.conf
echo ""                                                                         >> /etc/nginx/nginx.conf
echo "        ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3; # Dropping SSLv3, ref: POODLE"  >> /etc/nginx/nginx.conf
echo "        ssl_prefer_server_ciphers on;"                                    >> /etc/nginx/nginx.conf
echo ""                                                                         >> /etc/nginx/nginx.conf
echo "        ##"                                                               >> /etc/nginx/nginx.conf
echo "        # Logging Settings"                                               >> /etc/nginx/nginx.conf
echo "        ##"                                                               >> /etc/nginx/nginx.conf
echo ""                                                                         >> /etc/nginx/nginx.conf
echo "        access_log /var/log/nginx/access.log;"                            >> /etc/nginx/nginx.conf
echo "        error_log /var/log/nginx/error.log;"                              >> /etc/nginx/nginx.conf
echo ""                                                                         >> /etc/nginx/nginx.conf
echo "        ##"                                                               >> /etc/nginx/nginx.conf
echo "        # Gzip Settings"                                                  >> /etc/nginx/nginx.conf
echo "        ##"                                                               >> /etc/nginx/nginx.conf
echo ""                                                                         >> /etc/nginx/nginx.conf
echo "        gzip on;"                                                         >> /etc/nginx/nginx.conf
echo ""                                                                         >> /etc/nginx/nginx.conf
echo "        # gzip_vary on;"                                                  >> /etc/nginx/nginx.conf
echo "        # gzip_proxied any;"                                              >> /etc/nginx/nginx.conf
echo "        # gzip_comp_level 6;"                                             >> /etc/nginx/nginx.conf
echo "        # gzip_buffers 16 8k;"                                            >> /etc/nginx/nginx.conf
echo "        # gzip_http_version 1.1;"                                         >> /etc/nginx/nginx.conf
echo "        # gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;">> /etc/nginx/nginx.conf
echo ""                                                                         >> /etc/nginx/nginx.conf
echo "        ##"                                                               >> /etc/nginx/nginx.conf
echo "        # Virtual Host Configs"                                           >> /etc/nginx/nginx.conf
echo "        ##"                                                               >> /etc/nginx/nginx.conf
echo ""                                                                         >> /etc/nginx/nginx.conf
echo "        include /etc/nginx/conf.d/*.conf;"                                >> /etc/nginx/nginx.conf
echo "        include /etc/nginx/sites-enabled/*;"                              >> /etc/nginx/nginx.conf
echo "}"                                                                        >> /etc/nginx/nginx.conf
echo ""                                                                         >> /etc/nginx/nginx.conf
echo ""                                                                         >> /etc/nginx/nginx.conf
echo "#mail {"                                                                  >> /etc/nginx/nginx.conf
echo "#       # See sample authentication script at:"                           >> /etc/nginx/nginx.conf
echo "#       # http://wiki.nginx.org/ImapAuthenticateWithApachePhpScript"      >> /etc/nginx/nginx.conf
echo "#"                                                                        >> /etc/nginx/nginx.conf
echo "#       # auth_http localhost/auth.php;"                                  >> /etc/nginx/nginx.conf
echo "#       # pop3_capabilities TOP USER;"                                    >> /etc/nginx/nginx.conf
echo "#       # imap_capabilities IMAP4rev1 UIDPLUS;"                           >> /etc/nginx/nginx.conf
echo "#"                                                                        >> /etc/nginx/nginx.conf
echo "#       server {"                                                         >> /etc/nginx/nginx.conf
echo "#               listen     localhost:110;"                                >> /etc/nginx/nginx.conf
echo "#               protocol   pop3;"                                         >> /etc/nginx/nginx.conf
echo "#               proxy      on;"                                           >> /etc/nginx/nginx.conf
echo "#       }"                                                                >> /etc/nginx/nginx.conf
echo "#"                                                                        >> /etc/nginx/nginx.conf
echo "#       server {"                                                         >> /etc/nginx/nginx.conf
echo "#               listen     localhost:143;"                                >> /etc/nginx/nginx.conf
echo "#               protocol   imap;"                                         >> /etc/nginx/nginx.conf
echo "#               proxy      on;"                                           >> /etc/nginx/nginx.conf
echo "#       }"                                                                >> /etc/nginx/nginx.conf
echo "#}"                                                                       >> /etc/nginx/nginx.conf

cd /var/www/$1/html/
sudo wget https://wordpress.org/latest.tar.gz
sudo tar -xzvf latest.tar.gz
cd wordpress/
sudo mv * /var/www/$1/html/