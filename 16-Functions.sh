#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
 echo "Please run this script with root user acess"
 exit 1
fi

VALIDATE(){
if [ $1 -ne 0 ]; then
    echo "$2.......FAILURE"
else
    echo "$2.......SUCCESS"
fi
}   

dnf install nginx -y
VALIDATE $? Installing