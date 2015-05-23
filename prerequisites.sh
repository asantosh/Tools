#!/bin/sh

PKG_NAME="build-essential \
	 subversion  \
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

@sudo apt-get update

@for PKG in $PKG_NAME
do
    echo "=================Now installing......[$PKG]"
    sudo apt-get install -y $PKG
    echo "===========================================\n"
done
