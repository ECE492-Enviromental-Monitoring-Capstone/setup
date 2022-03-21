#!/bin/bash

# This script is intended to create an image and write it to an
# SD card for use with a Raspberry Pi.

# Usage: sudo setup_sd_card.sh <scratch_directory> <SD card device>

# NOTE! BE VERY CAREFUL WITH THE SD CARD DEVICE.
# IT IS PROBABLY /dev/sdc or something.
# BUT DOUBLE TRIPLE CHECK BEFORE YOU SCREW STUFF UP.
# This script doesn't redownload files if they already exist.

# Basic variables
pi_os_url="https://downloads.raspberrypi.org/raspios_lite_armhf/images/raspios_lite_armhf-2022-01-28/2022-01-28-raspios-bullseye-armhf-lite.zip"

# Check to make sure user arguments are correct.
if [ -z "$1" ]
then
	echo First argument should be a scratch directory
	echo ex: ./temp/
	exit 1
fi
if [ -z "$2" ]
then
	echo Second argument should be microSD card device
	echo Double triple check which device it is.
	echo Check using "sudo fdisk -l"
	echo ex: /dev/sdc
	exit 1
fi

echo "Making Directory"
mkdir $1/

echo "Fetching Pi OS"
wget -nc -P "$1/" "${pi_os_url}"

echo "Unzipping OS"
unzip -n  -d "$1/" "${1}/*.zip"

fdisk -l "$2"
while true
do
	read -p "ARE YOU SURE ${2} is the SD CARD? [Y/N]?" yn
	case $yn in
		[Yy]*) break;;
		[Nn]*) echo "Exiting"; exit;;
		*) echo ";;
	esac
done

