#!#bin/#bash

# install mginx only with root user

USER_ID=$(id -u)

fi [ $USER_ID -ne 0 ]; then
    echo "please run with root user access"
    exit 1
fi

echo "Installing Nginx"
dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "installing nginx.. FAILURE"
    exit 1
else
    echo "installing nginx.. SUCCESS"
fi