#!/bin/sh

# Define variables
Path_available ="/etc/nginx/sites-available/"
Path_nginx_conf ="/etc/nginx/nginx.conf"
# Create directory for site
sudo mkdir -p /var/www/$1/html
sudo chown -R $USER:$USER /var/www/$1
# Create index.html
echo "<h1>Welcome to $1</h1>"> /var/www/$1/html/index.html
# Create configuration file for site
sudo touch $Path_available$1
sudo chown $USER:$USER $Path_available$1
echo "server {"                                                    >> $Path_available$1
echo "        listen 80;"                                          >> $Path_available$1
echo "        listen [::]:80;"                                     >> $Path_available$1
echo ""                                                            >> $Path_available$1
echo "        root /var/www/$1/html;"                              >> $Path_available$1
echo "        index index.html index.htm index.nginx-debian.html;" >> $Path_available$1
echo ""                                                            >> $Path_available$1
echo "        server_name $1 www.$1;"                              >> $Path_available$1
echo ""                                                            >> $Path_available$1
echo "        location / {"                                        >> $Path_available$1
echo "                try_files $uri $uri/ =404;"                  >> $Path_available$1
echo "        }"                                                   >> $Path_available$1
echo "        location ~ \.php$ {"                                 >> $Path_available$1
echo "                include snippets/fastcgi-php.conf;"          >> $Path_available$1
echo "           #fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;" >> $Path_available$1
echo "		          fastcgi_pass 127.0.0.1:9000;"                >> $Path_available$1
echo "        }"                                                   >> $Path_available$1
echo "}"                                                           >> $Path_available$1
sudo chown root:root $Path_available$1

sudo ln -s /etc/nginx/sites-available/your_domain /etc/nginx/sites-enabled/

sudo chown $USER:$USER $Path_nginx_conf
echo "user www-data;"                                                           > $Path_nginx_conf
echo "worker_processes auto;"                                                   >> $Path_nginx_conf
echo "pid /run/nginx.pid;"                                                      >> $Path_nginx_conf
echo "include /etc/nginx/modules-enabled/*.conf;"                               >> $Path_nginx_conf
echo ""                                                                         >> $Path_nginx_conf
echo "events {"                                                                 >> $Path_nginx_conf
echo "        worker_connections 768;"                                          >> $Path_nginx_conf
echo "        # multi_accept on;"                                               >> $Path_nginx_conf
echo "}"                                                                        >> $Path_nginx_conf
echo ""                                                                         >> $Path_nginx_conf
echo "http {"                                                                   >> $Path_nginx_conf
echo ""                                                                         >> $Path_nginx_conf
echo "        ##"                                                               >> $Path_nginx_conf
echo "        # Basic Settings"                                                 >> $Path_nginx_conf
echo "        ##"                                                               >> $Path_nginx_conf
echo ""                                                                         >> $Path_nginx_conf
echo "        sendfile on;"                                                     >> $Path_nginx_conf
echo "        tcp_nopush on;"                                                   >> $Path_nginx_conf
echo "        types_hash_max_size 2048;"                                        >> $Path_nginx_conf
echo "        # server_tokens off;"                                             >> $Path_nginx_conf
echo ""                                                                         >> $Path_nginx_conf
echo "        server_names_hash_bucket_size 64;"                                >> $Path_nginx_conf
echo "        # server_name_in_redirect off;"                                   >> $Path_nginx_conf
echo ""                                                                         >> $Path_nginx_conf
echo "        include /etc/nginx/mime.types;"                                   >> $Path_nginx_conf
echo "        default_type application/octet-stream;"                           >> $Path_nginx_conf
echo ""                                                                         >> $Path_nginx_conf
echo "        ##"                                                               >> $Path_nginx_conf
echo "        # SSL Settings"                                                   >> $Path_nginx_conf
echo "        ##"                                                               >> $Path_nginx_conf
echo ""                                                                         >> $Path_nginx_conf
echo "        ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3; # Dropping SSLv3, ref: POODLE"  >> $Path_nginx_conf
echo "        ssl_prefer_server_ciphers on;"                                    >> $Path_nginx_conf
echo ""                                                                         >> $Path_nginx_conf
echo "        ##"                                                               >> $Path_nginx_conf
echo "        # Logging Settings"                                               >> $Path_nginx_conf
echo "        ##"                                                               >> $Path_nginx_conf
echo ""                                                                         >> $Path_nginx_conf
echo "        access_log /var/log/nginx/access.log;"                            >> $Path_nginx_conf
echo "        error_log /var/log/nginx/error.log;"                              >> $Path_nginx_conf
echo ""                                                                         >> $Path_nginx_conf
echo "        ##"                                                               >> $Path_nginx_conf
echo "        # Gzip Settings"                                                  >> $Path_nginx_conf
echo "        ##"                                                               >> $Path_nginx_conf
echo ""                                                                         >> $Path_nginx_conf
echo "        gzip on;"                                                         >> $Path_nginx_conf
echo ""                                                                         >> $Path_nginx_conf
echo "        # gzip_vary on;"                                                  >> $Path_nginx_conf
echo "        # gzip_proxied any;"                                              >> $Path_nginx_conf
echo "        # gzip_comp_level 6;"                                             >> $Path_nginx_conf
echo "        # gzip_buffers 16 8k;"                                            >> $Path_nginx_conf
echo "        # gzip_http_version 1.1;"                                         >> $Path_nginx_conf
echo "        # gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;">> $Path_nginx_conf
echo ""                                                                         >> $Path_nginx_conf
echo "        ##"                                                               >> $Path_nginx_conf
echo "        # Virtual Host Configs"                                           >> $Path_nginx_conf
echo "        ##"                                                               >> $Path_nginx_conf
echo ""                                                                         >> $Path_nginx_conf
echo "        include /etc/nginx/conf.d/*.conf;"                                >> $Path_nginx_conf
echo "        include /etc/nginx/sites-enabled/*;"                              >> $Path_nginx_conf
echo "}"                                                                        >> $Path_nginx_conf
echo ""                                                                         >> $Path_nginx_conf
echo ""                                                                         >> $Path_nginx_conf
echo "#mail {"                                                                  >> $Path_nginx_conf
echo "#       # See sample authentication script at:"                           >> $Path_nginx_conf
echo "#       # http://wiki.nginx.org/ImapAuthenticateWithApachePhpScript"      >> $Path_nginx_conf
echo "#"                                                                        >> $Path_nginx_conf
echo "#       # auth_http localhost/auth.php;"                                  >> $Path_nginx_conf
echo "#       # pop3_capabilities TOP USER;"                                    >> $Path_nginx_conf
echo "#       # imap_capabilities IMAP4rev1 UIDPLUS;"                           >> $Path_nginx_conf
echo "#"                                                                        >> $Path_nginx_conf
echo "#       server {"                                                         >> $Path_nginx_conf
echo "#               listen     localhost:110;"                                >> $Path_nginx_conf
echo "#               protocol   pop3;"                                         >> $Path_nginx_conf
echo "#               proxy      on;"                                           >> $Path_nginx_conf
echo "#       }"                                                                >> $Path_nginx_conf
echo "#"                                                                        >> $Path_nginx_conf
echo "#       server {"                                                         >> $Path_nginx_conf
echo "#               listen     localhost:143;"                                >> $Path_nginx_conf
echo "#               protocol   imap;"                                         >> $Path_nginx_conf
echo "#               proxy      on;"                                           >> $Path_nginx_conf
echo "#       }"                                                                >> $Path_nginx_conf
echo "#}"                                                                       >> $Path_nginx_conf
sudo chown root:root $Path_nginx_conf