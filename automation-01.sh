#!/bin/bash

## Install Java and Jenkins

sudo apt install openjdk-11-jre-headless -y
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update -y
sudo apt install jenkins -y
sudo systemctl start jenkins
sudo ufw disable

## Install Ansible
sudo apt update -y
sudo apt install ansible -y

## Install git
sudo apt update -y
sudo apt install git -y

## Install doctl
cd ~
wget https://github.com/digitalocean/doctl/releases/download/v1.66.0/doctl-1.66.0-linux-amd64.tar.gz
tar xf ~/doctl-1.66.0-linux-amd64.tar.gz
sudo mv ~/doctl /usr/local/bin
rm -rf ~/doctl-1.66.0-linux-amd64.tar.gz

## Install kubectl
sudo apt update -y
sudo apt install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update -y
sudo apt install -y kubectl

cd # 
rm -rf automation-01.sh
