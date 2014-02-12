#/bin/sh

set -e

# Synchronise package databases
pacman -Sy

# Download packages
TMP_DIR=$(mktemp -d)
PACKAGE=linux-headers-raspberrypi-aufs_friendly-3.10.19-1-armv6h.pkg.tar.xz
echo "Downloading $PACKAGE"
curl --progress-bar -L https://github.com/resin-io/linux-raspberrypi-aufs_friendly-PKGBUILD/releases/download/v3.10.19-1-ARCH/$PACKAGE > $TMP_DIR/$PACKAGE

PACKAGE=linux-raspberrypi-aufs_friendly-3.10.19-1-armv6h.pkg.tar.xz
echo "Downloading $PACKAGE"
curl --progress-bar -L https://github.com/resin-io/linux-raspberrypi-aufs_friendly-PKGBUILD/releases/download/v3.10.19-1-ARCH/$PACKAGE > $TMP_DIR/$PACKAGE

PACKAGE=aufs3-util-20130907-1-armv6h.pkg.tar.xz
echo "Downloading $PACKAGE"
curl --progress-bar -L https://github.com/resin-io/aufs3-util-PKGBUILD/releases/download/v20130907-1/$PACKAGE > $TMP_DIR/$PACKAGE

PACKAGE=docker-0.8.0-1-armv6h.pkg.tar.xz
echo "Downloading $PACKAGE"
curl --progress-bar -L https://github.com/resin-io/lxc-docker-PKGBUILD/releases/download/v0.8.0-1/$PACKAGE > $TMP_DIR/$PACKAGE

# Install packages
yes | pacman -U $TMP_DIR/linux-headers-raspberrypi-aufs_friendly-3.10.19-1-armv6h.pkg.tar.xz \
    $TMP_DIR/linux-raspberrypi-aufs_friendly-3.10.19-1-armv6h.pkg.tar.xz \
    $TMP_DIR/aufs3-util-20130907-1-armv6h.pkg.tar.xz \
    $TMP_DIR/docker-0.8.0-1-armv6h.pkg.tar.xz

# Cleanup
rm -rf $TMP_DIR

echo "Installation successful. You should reboot your system before trying to run docker. :)"
