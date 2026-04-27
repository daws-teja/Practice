#!/bin/bash

USERID=$(id -u)
LOG_FOLDER="/var/log/shellscript"
LOG_FILE="/var/log/shellscript/$0.log"

if [ $USERID -ne 0 ]; then
    echo please run this script with root user access
    exit 1
fi

mkdir -p $LOG_FOLDER

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "$2 .. FAILURE"
    else
        echo "$2 .. SUCCESSFUL"
    fi
}


for package in $@
do
    dnf install $package -y &>> $LOG_FILE
    VALIDATE $? "installing $package" 
done