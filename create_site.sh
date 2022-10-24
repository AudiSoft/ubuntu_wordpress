#!/bin/bash
# Create directory for site
sudo mkdir -p /var/www/$1/html
sudo chown -R $USER:$USER /var/www/$1
# Create index.html
echo "<h1>Welcome to $1</h1>"> /var/www/$1/html/index.html
