#! /bin/bash

set -e

echo "#########################################################"
echo "##                                                     ##"
echo "##               INSTALLING TOMCAT                     ##"
echo "##                                                     ##"
echo "#########################################################"

echo "Cleaning up previous installations"

sudo rm -rf /opt/tomcat apache-tomcat-9.0.100.tar.gz apache-tomcat-9.0.100

echo "Downloading Tomcat 9.0.100"

wget -q https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.100/bin/apache-tomcat-9.0.100.tar.gz 



sudo tar -xzf apache-tomcat-9.0.100.tar.gz
sudo rm -rf apache-tomcat-9.0.100.tar.gz

sudo chown root:root context.xml
sudo chown root:root tomcat-users.xml

sudo chmod 640 context.xml
sudo chmod 600 tomcat-users.xml

sudo mv apache-tomcat-9.0.100 /opt/tomcat

sudo rm -rf /opt/tomcat/conf/tomcat-users.xml
sudo rm -rf /opt/tomcat/webapps/host-manager/META-INF/context.xml
sudo rm -rf /opt/tomcat/webapps/manager/META-INF/context.xml

sudo cp tomcat-users.xml /opt/tomcat/conf/
sudo cp context.xml /opt/tomcat/webapps/host-manager/META-INF/
sudo cp context.xml /opt/tomcat/webapps/manager/META-INF/

sudo sh /opt/tomcat/bin/startup.sh


if [ $? -eq 0 ]; then
    echo "       "
    echo "Tomcat has been installed successfully"
    echo "       "
    echo "*************************************************************"
    echo "      "
    echo "ACCESS TOMCAT ON http://$(curl -s ifconfig.me):8080"
    echo "      "
    echo "*************************************************************"

else
    echo "Tomcat installation failed"
fi
