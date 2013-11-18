#/bin/sh

set -e

# Synchronise package databases
pacman -Sy

# Download packages
TMP_DIR=$(mktemp -d)
echo "Downloading package (1/4)"
wget -nv -P $TMP_DIR https://github.com/resin-io/linux-raspberrypi-aufs_friendly-PKGBUILD/releases/download/v3.10.19-1-ARCH/linux-headers-raspberrypi-aufs_friendly-3.10.19-1-armv6h.pkg.tar.xz

echo "Downloading package (2/4)"
wget -nv -P $TMP_DIR https://github.com/resin-io/linux-raspberrypi-aufs_friendly-PKGBUILD/releases/download/v3.10.19-1-ARCH/linux-raspberrypi-aufs_friendly-3.10.19-1-armv6h.pkg.tar.xz

echo "Downloading package (3/4)"
wget -nv -P $TMP_DIR https://github.com/resin-io/aufs3-util-PKGBUILD/releases/download/v20130907-1/aufs3-util-20130907-1-armv6h.pkg.tar.xz

echo "Downloading package (4/4)"
wget -nv -P $TMP_DIR https://github.com/resin-io/lxc-docker-PKGBUILD/releases/download/v0.6.4-2/lxc-docker-0.6.4-2-armv6h.pkg.tar.xz

# Install packages
yes | pacman -U $TMP_DIR/linux-headers-raspberrypi-aufs_friendly-3.10.19-1-armv6h.pkg.tar.xz \
    $TMP_DIR/linux-raspberrypi-aufs_friendly-3.10.19-1-armv6h.pkg.tar.xz \
    $TMP_DIR/aufs3-util-20130907-1-armv6h.pkg.tar.xz \
    $TMP_DIR/lxc-docker-0.6.4-2-armv6h.pkg.tar.xz

# Cleanup
rm -rf $TMP_DIR

echo "Installation successful. You should reboot your system before trying to run docker. :)"