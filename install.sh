#! /bin/bash

set -e

if [ $USER = "ec2-user" ]; then
    echo "Installing the packages"
    sudo yum update -y
    sudo yum install httpd -y
    sudo yum install java -y
    sudo yum install wget -y
    sudo yum install git -y
    sudo yum install net-tools -y
    sudo yum install tree -y

else
    echo "THESE PACKAGES CAN ONLY BE INSTALLED BY THE EC2-USER"

fi
