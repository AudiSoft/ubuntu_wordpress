#!/bin/bash
# Install nginx server
sudo apt install ngix
# Get nginx version. Example: 1.22.0
nginx -v
# Check nginx is responsive
curl localhost
