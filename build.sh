#!/bin/bash

# Update package information
apt-get update

# Install wget
apt-get -y install wget

# Install default JDK
apt-get -y install default-jdk

# Download ZAP
wget https://github.com/zaproxy/zaproxy/releases/download/v2.11.1/ZAP_2.11.1_Linux.tar.gz

# Extract ZAP
tar -xvf ZAP_2.11.1_Linux.tar.gz

# Change directory to ZAP
cd ZAP_2.11.1

# Run ZAP command
./zap.sh -cmd -quickurl https://www.example.com -quickprogress -quickout ../zap_report.html
