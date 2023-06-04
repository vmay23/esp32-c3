#!/bin/bash

#---------------------------------------------------------------------------
#---------------------------------------------------------------------------
#----	
#----	title: 		cloning and install Nuttx and Nuttx refer tools
#----	author:   viniciusmay23
#----	refer:		acassis (Nuttx Channel)
#----	date:		  2021/01/15
#++++   rev date:    2023/05/16
#====   rev reason:  running over ESP32-C3 RISC-V 
#----   
#---------------------------------------------------------------------------

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#Cloning and install Nuttx Kernel Application
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo '============================================'
echo 'Cloning and install Nuttx Kernel Application'
echo '============================================'
echo ''

# as nuttx build system is like to the linux filesystem,
# we have to use the kconfig-frontends as system configuration.
# due this we have to proced with the download of the folder 'tool'. 
cd ~/nuttxspace 
git clone https://bitbucket.org/nuttx/tools.git
git clone https://github.com/apache/incubator-nuttx.git nuttx
git clone https://github.com/apache/incubator-nuttx-apps.git apps


echo '========================================'
echo 'cd ~/nuttxspace/tools/kconfig-frontends/'
echo '========================================'
echo ''
cd ~/nuttxspace/tools/kconfig-frontends/


echo '===================================='
echo 'configuring...                      '
echo '===================================='
echo ''
./configure --enable-mconf
aclocal 			# with any option needed (such as -I m4)
autoconf
automake --add-missing --force-missing

echo '===================================='
echo 'compiling...                        '
echo '===================================='
echo ''
make

echo '===================================='
echo 'installing...                       '
echo '===================================='
echo ''
sudo make install
sudo ldconfig




