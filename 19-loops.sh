#!/bin/bash

USERID=$(id -u)
LOG_FOLDER=/var/log/shell-practice
LOG_File=/var/log/shell-practice/$0.log

if [ $USERID -ne 0 ]; then
 echo "Please run this script with root user acess"
 exit 1
fi

mkdir -p $LOG_FOLDER

VALIDATE(){
if [ $1 -ne 0 ]; then
    echo "$2.......FAILURE" | tee -a $LOG_File
    exit 1
else
    echo "$2.......SUCCESS" | tee -a $LOG_File
fi
}   

for package in $@
do 
    dnf install $package -y &>>$LOG_File
    VALIDATE $? "$package installation"
done





