#!/bin/bash

# Script by Leprechaun
# leproide@paranoici.org

# Check root
if [ “$(id -u)” != “0” ]; then
tput setaf 1; tput bold; echo -e '\nPlease run as root\n' 2>&1
exit 1
fi

# Variables
kernel=$(uname -r | tr -d '+')
build=${build:-$(uname -v | awk '{print $1}' | tr -d '#')}

# Download driver
wget http://downloads.fars-robotics.net/wifi-drivers/8188eu-drivers/8188eu\-$kernel\-$build.tar.gz

# Create working directory
mkdir DriverDown

# Extract
tar xvf 8188eu\-$kernel\-$build.tar.gz -C DriverDown

# Delete tar
rm -f 8188eu\-$kernel\-$build.tar.gz

# Install driver
cd DriverDown
./install.sh

# Delete file
cd ..
rm -rf DriverDown

echo Done!
