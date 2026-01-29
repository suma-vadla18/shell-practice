#!/bin/bash

USERID=$(id -u)
LOG_FOLDER=/var/log/shell-practice
LOG_File=/var/log/shell-practice/$0.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[33m"


if [ $USERID -ne 0 ]; then
 echo -e "$R please run this script root user acess $N" | tee -a $LOG_File
 exit 1
fi

mkdir -p $LOG_FOLDER

VALIDATE(){
if [ $1 -ne 0 ]; then
    echo -e "$2.......$R FAILURE $N" | tee -a $LOG_File
    exit 1
else
    echo -e "$2.......$G SUCCESS $N" | tee -a $LOG_File
fi
}   

for package in $@
do 
    dnf list installed $package &>>LOG_File
    if [ $? -ne 0 ]; then
        echo "$package not installed, installing now"
        dnf install $package -y &>>$LOG_File
        VALIDATE $? "$package installation"
    else
        echo -e "$package alredy installed, $Y skipping $N"
    fi
done