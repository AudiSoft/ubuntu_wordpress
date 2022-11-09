#!/bin/bash
#login to mysql whit root
#sudo mysql
##create user
#CREATE USER 'henutsen'@'localhost' IDENTIFIED BY '123';
##asigne privileges to user
#GRANT ALL PRIVILEGES ON * . * TO 'henutsen'@'localhost';
#
#exit 
#
#mysql -u henutsen -p123
## create data base 
#CREATE DATABASE test;

sudo mysql < test.sql

sleep 20s