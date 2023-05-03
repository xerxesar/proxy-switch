#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"
# create debian package
DEBIAN_VERSION="0.2-1"
PKG_PATH="./proxy-switch_${DEBIAN_VERSION}_amd64"
mkdir -p $PKG_PATH/DEBIAN
cp ./control ./postinst $PKG_PATH/DEBIAN/
mkdir -p $PKG_PATH/usr/local/bin
cp ../../proxy-switch $PKG_PATH/usr/local/bin/
chmod +x $PKG_PATH/usr/local/bin/proxy-switch
dpkg-deb --build --root-owner-group proxy-switch_${DEBIAN_VERSION}_amd64
