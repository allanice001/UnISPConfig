#!/usr/bin/env bash

#####Universal script to install ISPConfig

if [ $(id -u) != "0" ]; then
    echo "Error: You must be root to run this script, please use the root user to install the software."
    exit 1
fi

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


TEST="$(check_os)"
echo ${TEST}

if [ ${TEST} = 'debian' ]; then
	echo 'Installing ISPConfig for Debian based system'
	source debian_install.sh
elif [ ${TEST} = 'centos' ]; then
	echo 'Installing ISPConfig for RHEL based system'
	source centos_install.sh
fi