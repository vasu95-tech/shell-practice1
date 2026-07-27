#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

#LOG_FILE="$LOG_FOLDER/$(echo "$0 | cut -d "." -f1").log"
LOG_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"
mkdir -p $LOG_FOLDER


USER_ID=$(id -u)
if [ $USER_ID -ne 0 ]; then
    echo -e "$R error $N run the script with root user"
    exit 1
fi
validate(){
    if [ $1 -ne 0 ]; then
     echo -e "installing $2 is $R failure $N" | tee -a $LOG_FILE
     exit 1
    else
     echo -e "installing $2 is $G success $N" | tee -a $LOG_FILE
    fi
}

dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$LOG_FILE
    validate $? nginx
else 
    echo -e "nginx is already exist $Y skipping $N" | tee -a $LOG_FILE
fi

    
