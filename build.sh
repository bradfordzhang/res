#!/bin/bash
if [ "$(date "+%u")" = "4" ]; then $(./delete) && sudo echo "" > /var/www/openwrt/self/index.text; fi
lede_time1=$(date "+%Y-%m-%d_%H:%M:%S")
git pull
git pull
./scripts/feeds update -a && ./scripts/feeds install -a -f
./scripts/feeds update -a && ./scripts/feeds install -a -f
make defconfig
make -j8 download
make -j$(($(nproc) + 1)) V=s
lede_time2=$(date "+%Y-%m-%d_%H:%M:%S")
lede_time3=$(date "+%d %u")

sudo mkdir /var/www/openwrt/self/$lede_time1~$lede_time2
sudo mv bin/targets/x86/64/* /var/www/openwrt/self/$lede_time1~$lede_time2
sudo rm /var/www/openwrt/self/$lede_time1~$lede_time2/openwrt-x86-64-generic-squashfs-rootfs.img.gz
sudo echo "$lede_time3 $lede_time1~$lede_time2">> /var/www/openwrt/self/index.text

if [ ! -f "/var/www/openwrt/self/$lede_time1~$lede_time2/openwrt-x86-64-generic-squashfs-combined-efi.img.gz" ];then python error.py && sudo rm -rf /var/www/openwrt/self/$lede_time1~$lede_time2/; fi
