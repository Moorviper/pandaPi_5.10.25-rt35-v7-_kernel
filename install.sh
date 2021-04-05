#!/bin/#!/bin/sh

echo -e "\033[1m \033[32m creating backup ... \033[0m"
if ! [ -d "/boot/bakup"] ; then
	mkdir -p /boot/bakup/kernel
	mkdir -p /boot/bakup/dtb
fi

echo -e "\033[1m \033[34m move dtb ... \033[0m"
mv /boot/*.dtb /boot/bakup/dtb/
echo -e "\033[1m \033[34m move kernel ... \033[0m"
mv /boot/*.img /boot/bakup/kernel/
echo -e "\033[1m \033[34m move overlays ... \033[0m"
mv /boot/overlays /boot/bakup/

echo -e "\033[1m \033[31m copying new files ... \033[0m"

echo -e "\033[1m \033[34m copying dtb to boot folder ... \033[0m"
cp boot/dts/bcm*.dtb /boot/
echo -e "\033[1m \033[34m copying overlays to boot folder ... \033[0m"
cp -r boot/dts/overlays /boot/
echo -e "\033[1m \033[34m copying zImage->kernel7 to boot folder ... \033[0m"
cp boot/zImage.img /boot/kernel7.img
echo -e "\033[1m \033[34m copying Image->kernel8 to boot folder ... \033[0m"
cp boot/Image.img /boot/kernel8.img

echo -e "\033[1m \033[47m - - - - D O N E - - - -  \033[0m"
