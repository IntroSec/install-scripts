#!/bin/bash

################################################################################
#
#    filename: kali-inst-rpi3.sh
# description: Script to put image on SDcard of RPI2/3
#      author: Andre Mattie
#       email: devel@introsec.ca
#         GPG: 5620 A200 6534 B779 08A8  B22B 0FA6 CD54 93EA 430D
#     bitcoin: 1LHsfZrES8DksJ41JAXULimLJjUZJf7Qns
#        date: 03/24/2017
#
################################################################################

# variables
DEVICE=$1
FILE="kali-2.1.2-rpi2.img.xz"
IMAGE="kali-2.1.2-rpi2.img"
SHA1SUM="db36fcd53c630fd32f2f8943dddd9f57b3673c5a"
CHECK=`sha1sum $IMAGE > kali-2.1.2-rpi2.sha1'
VERIFY=`cut -d* -f1 kali-2.1.2-rpi2.sha1`


# ensure user is root
if [ "$(id -u)" -ne "0" ] ; then
    echo "You must be root to run this script"
    exit 1
fi

if [ $1 == "" ]
then
	echo "Usage: kali-inst-rpi3.sh [sdcard location]
	echo "Example; ./kali-inst-rpi3.sh /dev/mmcblk0"

# make tmp folder and cd into it
mkdir ~/tmp
cd ~/tmp
# download Kali image for RPI2/3
wget https://images.offensive-security.com/arm-images/kali-2.1.2-rpi2.img.xz

# verify downloaded image
echo "Checking file: kali-2.1.2-rpi2.img"
echo "Using SHA1 file: kali-2.1.2-rpi2.sha1"
echo $CHECK
echo $VERIFY

if [ $VERIFY != $SHA1SUM ]
then
  echo "SHA1 sums don't match, please redownload the image"
else
  echo "checksums OK"
fi

# unzip image is checksums are good
if [ $VERIFY == $SHA1SUM ]
then
	echo "Decompressing Kali image"
	tar -xf kali-2.1.2-rpi2.img.xz
	echo "Decompression of Kali image finished"
	wait 10
	echo "installing image to $DEVICE"
	dd if=$IMAGE of=$DEVICE bs=512k
elif [ $VERIFY != $SHA1SUM ]
	echo "checksums don't match, redownload image file and try again"
fi
