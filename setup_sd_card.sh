#!/bin/bash

# This script is intended to create an image and write it to an
# SD card for use with a Raspberry Pi.

# Usage: sudo setup_sd_card.sh <scratch_directory> <SD card device>

# NOTE! BE VERY CAREFUL WITH THE SD CARD DEVICE.
# IT IS PROBABLY /dev/sdc or something.
# BUT DOUBLE TRIPLE CHECK BEFORE YOU SCREW STUFF UP.
# This script doesn't redownload files if they already exist.

if [ -z "$1"]
	echo First argument should be a scratch directory
	echo ex: ./temp/
	exit 1
fi

if [ -z "$2"]
	echo Second argument should be microSD card device
	echo Double triple check which device it is.
	echo Check using "sudo fdisk -l"
	echo ex: /dev/sdc
	exit 1
fi

