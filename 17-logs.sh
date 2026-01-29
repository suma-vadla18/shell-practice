#!/bin/bash

USERID=$(id -u)
LOG_FOLDER=/var/log/shell-practice
LOG_File=/var/log/shell-practice/$0.sh

if [ $USERID -ne 0 ]; then
 echo "Please run this script with root user acess"
 exit 1
fi

mkdir -p $LOG_FOLDER

VALIDATE(){
if [ $1 -ne 0 ]; then
    echo "$2.......FAILURE"
    exit 1
else
    echo "$2.......SUCCESS"
fi
}   

dnf install nginx -y &>>$LOG_File
VALIDATE $? "Installing Nginx"

dnf install mysql -y &>>$LOG_File
VALIDATE $? "Installing mysql"

dnf install nodejs -y &>>$LOG_File
VALIDATE $? "Installing nodejs"
