#!/bin/bash

################################################################################
#
#    filename: kali-tools.sh
# description: Script to install kali tools on RPI2/3
#      author: Andre Mattie
#       email: devel@introsec.ca
#         GPG: 5620 A200 6534 B779 08A8  B22B 0FA6 CD54 93EA 430D
#     bitcoin: 1LHsfZrES8DksJ41JAXULimLJjUZJf7Qns
#        date: 03/24/2017
#
################################################################################

# variables
RED='\033[0;41;30m'
STD='\033[0;0;39m'

# ensure script is run as root
if [ "$(id -u)" -ne "0" ] ; then
    echo "You must be root to run this script"
    exit 1
fi

# define menu option commands
pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}

one(){
	echo "Installing kali-linux-all"
	apt-get update 
	apt-get install -y kali-linux-all
        pause
}

two(){
	echo "Installing kali-linux-full"
	apt-get update
	apt-get install -y kali-linux-full
        pause
}

three(){
	echo "Installing kali-linux-all"
	apt-get update
	apt-get install -y kali-linux-all
        pause
}

four(){
	echo "Installing kali-linux-all"
	apt-get update
	apt-get install -y kali-linux-all
        pause
}

five(){
	echo "Installing kali-linux-all"
	apt-get update
	apt-get install -y kali-linux-all
        pause
}

six(){
	echo "Installing kali-linux-all"
	apt-get update
	apt-get install -y kali-linux-all
        pause
}

seven(){
	echo "Installing kali-linux-all"
	apt-get update
	apt-get install -y kali-linux-all
        pause
}

eight(){
	echo "Installing kali-linux-all"
	apt-get update
	apt-get install -y kali-linux-all
        pause
}

nine(){
	echo "Installing kali-linux-all"
	apt-get update
	apt-get install -y kali-linux-all
        pause
}

ten(){
	echo "Installing kali-linux-all"
	apt-get update
	apt-get install -y kali-linux-all
        pause
}

eleven(){
	echo "Installing kali-linux-all"
	apt-get update
	apt-get install -y kali-linux-all
        pause
}

twelve(){
	echo "Installing kali-linux-all"
	apt-get update
	apt-get install -y kali-linux-all
        pause
}

# Display menu
show_menus() {
	clear
	echo "~~~~~~~~~~~~~~~~~~~~~"	
	echo " M A I N - M E N U"
	echo "~~~~~~~~~~~~~~~~~~~~~"
	echo "1) install kali-linux-all"
	echo "2) install kali-linux-full"
	echo "3) install kali-linux-pwtools"
	echo "4) install kali-linux-web"
	echo "5) install kali-linux-web"
	echo "6) install kali-linux-web"
	echo "7) install kali-linux-web"
	echo "8) install kali-linux-web"
	echo "9) install kali-linux-web"
	echo "10) install kali-linux-web"
	echo "11) install kali-linux-web"
	echo "12) install kali-linux-web"
	echo "99) Exit script"

}

# get choice from user
read_options(){
	local choice
	read -p "Enter choice [ 1 - 12] " choice
	case $choice in
		1) one ;;
		2) two ;;
		3) three ;;
		4) four ;;
		5) five ;;
		6) six ;;
		7) seven ;;
		8) eight ;;
		9) nine ;;
		10) ten ;;
		11) eleven ;;
		12) twelve ;;
		99) exit 0;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
	esac
}

# define escapes 
trap '' SIGINT SIGQUIT SIGTSTP

# main logic (infinite loop)
while true
do
	show_menus
	read_options
done