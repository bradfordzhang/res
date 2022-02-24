#!/usr/bin/env bash

apt-get update && apt-get upgrade -y
apt-get install software-properties-common build-essential gcc g++ -y
add-apt-repository ppa:ubuntu-toolchain-r/test -y
apt-get install gcc-11 g++-11 -y
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 110 --slave /usr/bin/g++ g++ /usr/bin/g++-11
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 90 --slave /usr/bin/g++ g++ /usr/bin/g++9
add-apt-repository ppa:xmake-io/xmake -y
add-apt-repository ppa:git-core/ppa -y
apt install xmake git -y
