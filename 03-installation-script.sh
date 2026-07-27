#!/bin/bash
  
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USER_ID=$(id -u)
if [ $USER_ID -ne 0 ]; then
    echo -e "$R error $N run the script with root privilage"
    exit 0
fi

validate(){
    if [ $1 -ne 0 ]; then
    echo -e "$2 installation is $R failed $N"
    exit 1
    else
    echo -e "$2 installation is $G success $N"
    fi
}

dnf list installed nginx
if [ $? -eq 0 ]; then 
    echo -e "nginx is already installed $Y skipping $N"
    else 
    dnf install nginx -y 
    validate $? nginx
fi    


dnf list installed python3
if [ $? -eq 0 ]; then 
    echo -e "python3 is already installed $Y skipping $N"
    exit 1
    else 
    dnf install python3 -y 
    validate $? python3
fi    


