#!/bin/bash
set -e
PREFIX=/usr/local/
CHECKOUT_DIR=nvm
DESCRIPTION="Node Version Manager - allow multiple versions of NodeJS"
rm -rf $CHECKOUT_DIR
git clone https://github.com/creationix/nvm.git $CHECKOUT_DIR
cd nvm
TAG=`git describe --abbrev=0 --tags`
VERSION=`echo $TAG |sed 's/^[^0-9]*//'`
git reset --hard $TAG
cd ..
fpm -f -s dir -t deb -n nvm -v $VERSION -x $CHECKOUT_DIR/test -x $CHECKOUT_DIR/'*.md' -x $CHECKOUT_DIR/Makefile -x $CHECKOUT_DIR/'.*' --prefix=$PREFIX --description="${DESCRIPTION}" nvm
