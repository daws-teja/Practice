#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo please run this script with root user access
    exit 1
fi

dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "nginx installation.. FAILURE"
else
    echo "nginx installation.. SUCCESSFUL"