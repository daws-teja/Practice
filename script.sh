#!/bin/bash

USERID=$(id -U)

if ($USERID -ne 0); then
    echo please run this script with root user access
    exit 1
else
    echo you are good to go
fi