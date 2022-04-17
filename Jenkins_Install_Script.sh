#!/bin/bash
# Install Jenkins server on Ubuntu 18.04 OS
#Step 1: Install Java
echo "Updating packages with sudo apt update......."
sudo apt-get update >> /dev/null 2>&1 
echo "Installing OpenJDK 8......."
sudo apt-get install openjdk-8-jdk -y >> /dev/null 2>&1 
echo "Installed OpenJDK8 completed successfully......"
echo "Installing OpenJDK 11..............."
sudo apt-get install openjdk-11-jdk -y >> /dev/null 2>&1 
echo "Installed OpenJDK 11 completed successfully......"
#Step 2: Add the Jenkins Repository
echo "Importing the GPG key........."
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo "Imported  the GPG key successfully........."
#Add the Jenkins software repository to the sources list and provide the key for authentication:
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
#Step 3: Install Jenkins
echo "Updating packages with sudo apt update......."
sudo apt-get update >> /dev/null 2>&1 
echo "Installing Jenkins package......."
sudo apt-get install jenkins -y >> /dev/null 2>&1 
echo "Installed Jenkins package completed successfully......"
#To check Jenkins was installed and is running enter:
# echo "check status of Jenkins"
# sudo systemctl status jenkins >> /dev/null 2&1 