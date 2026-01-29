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

echo "installing mysql"
dnf install mysql -y
if [ $? -ne 0 ]; then
    echo "Installing mysql...FAILURE"
else
    echo "Installing mysql...SUCCESS"
fi

echo "installing nodejs"
dnf install nodejs -y
if [ $? -ne 0 ]; then
    echo "Installing nodejs....FAILURE"
else
    echo "Installing nodejs.....SUCCESS
fi