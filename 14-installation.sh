#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
 echo "Please run this script with root user acess"
 exit 1
fi
echo "installing nginx"
dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "Installing Nginx...FAILURE"
else
    echo "Installing Nginx...SUCCESS"
fi