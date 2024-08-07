#! /bin/bash

wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.91/bin/apache-tomcat-9.0.91.tar.gz

sudo tar -xvzf apache-tomcat-9.0.91.tar.gz
sudo rm -rf apache-tomcat-9.0.91.tar.gz

sudo rm -rf apache-tomcat-9.0.91/conf/tomcat-users.xml
sudo rm -rf apache-tomcat-9.0.91/webapps/host-manager/META-INF/context.xml
sudo rm -rf apache-tomcat-9.0.91/webapps/manager/META-INF/context.xml

sudo chmod 640 /home/ec2-user/context.xml
sudo chmod 600 /home/ec2-user/tomcat-users.xml

sudo chown root:root /home/ec2-user/context.xml
sudo chown root:root /home/ec2-user/tomcat-users.xml


sudo cp /home/ec2-user/tomcat-users.xml  /home/ec2-user/apache-tomcat-9.0.91/conf/
sudo cp /home/ec2-user/context.xml  /home/ec2-user/apache-tomcat-9.0.91/webapps/host-manager/META-INF/
sudo cp /home/ec2-user/context.xml  /home/ec2-user/apache-tomcat-9.0.91/webapps/manager/META-INF/
