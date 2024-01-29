#!/bin/bash

sudo apt-get update
sudo apt install openjdk-11-jre-headless -y
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.85/bin/apache-tomcat-9.0.85.tar.gz
tar -xzf apache-tomcat-9.0.85.tar.gz
cd apache-tomcat-9.0.85/bin
bash startup.sh

