#!/bin/bash

USER_ID=$(id -u)
if [ $USER_ID -ne 0 ] then
    echo "run the script with root privilage"
fi

dnf install nginx -y
if [ $? -ne 0 ] then
    echo " nginx installation failed "
else 
    echo " nginx installation success "
fi    

