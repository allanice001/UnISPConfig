#!/usr/bin/env bash

#####Universal script to install ISPConfig

#if [ $(id -u) != "0" ]; then
#    echo "Error: You must be root to run this script, please use the root user to install the software."
#    exit 1
#fi
# Print Header

function check_os() {
	case `uname` in
	  Linux )
	     LINUX=1
	     which yum > /dev/null && { echo centos; }
	     #which zypper > /dev/null && { echo opensuse; }
	     which apt-get > /dev/null && { echo debian; }
	     ;;
	  Darwin )
	     DARWIN=1
	     ;;
	  * )
	     # Handle AmgiaOS, CPM, and modified cable modems here.
	     ;;
	esac
}  

if [ ${TEST} == 'debian' ]; then
	echo 'Installing ISPConfig for Debian based system'
	source install_debian.sh
elif [${TEST} == 'centos']; then
	echo 'Installing ISPConfig for RHEL based system'
	install_centos
fi