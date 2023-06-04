#!/bin/bash

#---------------------------------------------------------------------------
#---------------------------------------------------------------------------
#----	
#----	title: 		cloning and install Nuttx and Nuttx refer tools
#----	author:   	viniciusmay23
#----	refer:		acassis (Nuttx Channel)
#----	date:		2021/01/15
#++++   rev date:    2023/05/16
#====   rev reason:  disabling jlink and changing the git server
#----   
#---------------------------------------------------------------------------


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Install Linux tools
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sudo apt install -y automake bison build-essential flex gcc-arm-none-eabi gperf git libncurses5-dev libtool libusb-dev libusb-1.0-0-dev pkg-config


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Create a new repository for the Nuttx Workspace
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
mkdir ~/nuttxspace


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Cloning the OpenOCD repository from git
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cd ~/nuttxspace
git clone https://git.code.sf.net/p/openocd/code openOCD
cd openOCD


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ./bootstrap and configure tool
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./bootstrap
./configure --enable-internal-jimtcl --enable-maintainer-mode --disable-werror --disable-shared --enable-stlink --disable-jlink --enable-rlink --enable-vslink --enable-ti-icdi --enable-remote-bitbang

make
sudo make install




