#!/bin/sh

# Copy Files/vimrc to ~/.vimrc, to set vim editor
# Useful when working on Terminal

echo "##############################"
cp ../Files/vimrc ~/.vimrc
echo "\" Add new set list here\n"	>> $HOME/.vimrc
echo "########	DONE	########"


Go inside qemu
	./configure --prefix=/home/dewesh.kumar/opt
	make
	make install

	./configure --prefix=/home/dewesh.kumar/opt/qnew/
	./configure --target-list="arm-softmmu arm-linux-user" --enable-sdl --prefix=/home/dewesh.kumar/opt/qnew/
	
	./configure --prefix=/home/dewesh.kumar/QEMU/opt --enable-debug
	
edit bashrc for default path [qemu path and arm tool chain path]
	export PATH=/home/dewesh.kumar/opt/bin:/opt/arm-2012.09/bin:$PATH:
	
	
build latest kernel for which qemu is going to work
	--------------------
	export ARCH=arm
	export CROSS_COMPILE=arm-linux-gnueabi-
	cd linux-3.2
	make vexpress_defconfig
	make all
	--------------------
	make distclean
	make ARCH=arm vexpress_defconfig
	make ARCH=arm  menuconfig
	make ARCH=arm  CROSS_COMPILE=/home/dewesh.kumar/opt/4.3.2/bin/arm-none-linux-gnueabi-
	
compile c code with
	arm-none-linux-gnueabi-gcc -static hello.c -o hello
	echo hello|cpio -o --format=newc > initramfs
	
	qemu-system-arm -M vexpress-a9 -m 128M -kernel /home/dewesh.kumar/kernel/linux-3.8-rc2/arch/arm/boot/zImage -initrd initramfs -append "root=/dev/ram rdinit=/hello" -serial stdio

With KGDB	
	[qemu-system-arm -M vexpress-a9 -m 256M -kernel arch/arm/boot/zImage -initrd initramfs -append "root=/dev/ram rdinit=/hello console=ttyAMA0 kgdboc=ttyAMA1 kgdbwait" -serial stdio -serial tcp:localhost:2345,server,nowait]
	qemu-system-arm -M vexpress-a9 -m 256M -kernel arch/arm/boot/zImage -initrd initramfs -append "root=/dev/ram rdinit=/hello console=ttyAMA0 kgdboc=ttyAMA1 kgdbwait" -serial stdio -serial tcp:localhost:2345,server,nowait
	
		arm-none-linux-gnueabi-gdb vmlinux
		(gdb) target remote localhost:2345
	--------------------
	cp arch/arm/configs/vexpress_defconfig .config
	
	vi Makefile
	make menuconfig
	make -j 4 V=1 zImage
	--------------------
	qemu-system-arm -M vexpress-a9 -m 128M -kernel /home/dewesh.kumar/kernel/linux-3.7.1/arch/arm/boot/zImage -initrd initramfs -append "root=/dev/ram rdinit=/hello" -serial stdio
	qemu-system-arm -M vexpress-a9 -kernel arch/arm/boot/zImage -serial stdio
	
compile c code with
	arm-none-linux-gnueabi-gcc -static hello.c -o hello
	echo hello|cpio -o --format=newc > initramfs
    qemu-system-arm -M vexpress-a9 -m 128M -kernel /home/dewesh.kumar/kernel/linux-3.8-rc2/arch/arm/boot/zImage -initrd initramfs -append "root=/dev/ram rdinit=/hello" -serial stdio

	


	qemu-system-arm -M vexpress-a9 -kernel linux-3.2/arch/arm/boot/zImage -initrd initramfs -serial stdio -append "console=tty1"
		ex:qemu-system-arm -M vexpress-a9 -kernel linux-3.2/arch/arm/boot/zImage -initrd initramfs -serial stdio -append "console=tty1"
	qemu-system-arm -M vexpress-a9 -kernel arch/arm/boot/zImage -initrd ../../c_code/initramfs -serial stdio -append "console=ttyAMA0"
	qemu-system-arm -M vexpress-a9 -kernel ../kernel/linux-3.8-rc2/arch/arm/boot/zImage -initrd ../c_code/initramfs -serial stdio -append "console=tty1"

qemu-system-arm -kernel QEMU/arm-test/zImage.integrator -initrd QEMU/arm-test/arm_root.img
	or
	qemu-system-arm -kernel QEMU/arm-test/zImage.integrator -initrd QEMU/arm-test/arm_root.img -nographic -append "console=ttyAMA0"
	or
	qemu-system-arm -kernel QEMU/arm-test/zImage.integrator -initrd QEMU/arm-test/arm_root.img -serial stdio -append "console=ttyAMA0"
	
make distclean	
	
	
oss: Failed to open `/dev/dsp'	
	export LD_PRELOAD=libpulsedsp.so

	
	qemu-system-arm -M versatilepb -cpu cortex-a8 -kernel ./vmlinuz -hda arm-rootfs.img -m 256 -append "root=/dev/sda mem=256M devtmpfs.mount=0 rw"
	qemu-system-arm -M vexpress-a9 -cpu cortex-a9 -kernel ./vmlinuz -hda arm-rootfs.img -m 256 -append "root=/dev/sda mem=256M devtmpfs.mount=0 rw"

	qemu-system-arm -M vexpress-a9 -m 128M -kernel /home/dewesh.kumar/kernel/linux-3.8-rc2/arch/arm/boot/zImage -initrd initramfs -append "root=/dev/ram rdinit=/hello" -serial stdio
	
	
	
	
	================================================
export REDROSE_NFS_ROOT=/home/dewesh.kumar/nfsroot	


========Kernel Build=============
export PATH=/home/dewesh.kumar/NewRedRose_QEMU/toolchain/cross-gcc/bin:$PATH:
export PATH=/home/dewesh.kumar/NewRedRose_QEMU/toolchain/arm-taskone-gcc453-vfpv3-linux-gnueabi/bin:$PATH:
export ARCH=arm
export CROSS_COMPILE=arm-taskone-linux-gnueabi-
make qemuarm_defconfig
make all
===========Qemu Build =============

./configure --prefix=/home/dewesh.kumar/NewRedRose_QEMU/output/qemuimage
make all
make install
===============Make RootFs=================
dd if=/dev/zero of=qemuarm_rootfs.img count=3000 bs=1024k
dd if=/dev/zero of=qemuarm_rootfs.img count=64 bs=1024k
mkfs.ext2 qemuarm_rootfs.img
mount -t ext2 qemuarm_rootfs.img ./tmp
--------------------
1> dd if=/dev/zero of=512mb.img count=500 bs=1024k
2> mkfs.ext2 -F 512mb.img
3> cd /mnt
4> mkdir dskimg
5> sudo mount -t ext2 512mb.img /mnt/dskimg 
6> sudo cp -R <copy required> /mnt/dskimg

# chech whether the file contents are copied properly by listing files

7> sudo umount /mnt/dskimg
---------------------
echo ===============Make RootFs=================
dd if=/dev/zero of=qemuarm_rootfs.img count=3000 bs=1024k
mkfs.ext2 qemuarm_rootfs.img
rm -rf tmp
mkdir tmp
sudo mount -t ext2 qemuarm_rootfs.img ./tmp
sudo cp -dpR ./nfsrootls/qemuarmenv/. ./tmp2/
cd tmp2/
sudo chmod -Rf 777 *
cd ../
sudo umount ./tmp2/
=====================GIT commands=========
git blame filename.txt
=====================QEMU Run Command=========
./qemu-system-arm -kernel /home/dewesh.kumar/NewRedRose_QEMU/__output/qemuarm_zImzge -M vexpress-a9 -hda /home/dewesh.kumar/webos-image-qemuarm-20130206111013.rootfs.ext3 -serial stdio -m 256 --append "root=/dev/sda rw console=ttyAMA0,115200 mem=256M highres=off"
=========================ERROR========================================

input: ImExPS/2 Generic Explorer Mouse as /devices/fpga:07/serio1/input/input1
Kernel panic - not syncing: Attempted to kill init!
	
============================
du -h --max-depth=1
============================	
	
autoconf automake bison cmake flex g++ gettext gperf libtool pkg-config \
                                 tcl zlib1g-dev nodejs xutils-dev xsltproc python-libxml2
