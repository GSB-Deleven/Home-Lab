#!/bin/bash

set -o errexit

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root (use sudo)" 1>&2
   exit 1
fi

sudo apt-get install cifs-utils

echo ""
read -r -p "Enter the address of the NAS folder that you want to mount: " nasaddress
echo ""
read -r -p "Enter the local path where you want to mount the NAS folder: " localaddress
echo ""
read -r -p "Enter the path to store credentials file: " credentialaddress
echo ""
if [ ! -d $localaddress ]; then
    sudo mkdir -p $localaddress
fi
if [ ! -d $credentialaddress ]; then
    sudo mkdir -p $credentialaddress
fi
echo ""
read -r -p "Enter the username of the NAS: " nasusername
echo ""
read -r -p "Enter the NAS password: " naspassword
echo ""

sudo tee -a $credentialaddress/.NASCREDS <<_EOF_
username=$nasusername
password=$naspassword
_EOF_

echo ""
echo "$nasaddress  $localaddress  cifs  credentials=$credentialaddress/.NASCREDS,uid=1000,gid=1000,vers=1.0,sec=ntlm  0  01" >> /etc/fstab
echo ""
echo ""
