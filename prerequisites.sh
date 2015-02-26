#!/bin/sh

PKG_NAME="subversion  \
	 vim	     \
	 g++	     \
	 flex	     \
	 bison	     \
	 git	     \
	 screen	     \
	 autoconf    \
	 libtool     \
	 zlib1g-dev  \
	 ctags"

for PKG in $PKG_NAME
do
    echo "=================Now installing......[$PKG]"
    sudo apt-get install -y $PKG
    echo "===========================================\n"
done
