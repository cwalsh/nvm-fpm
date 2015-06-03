#!/bin/bash
set -e
PREFIX=/usr/local/
CHECKOUT_DIR=nvm
rm -rf $CHECKOUT_DIR
git clone https://github.com/creationix/nvm.git $CHECKOUT_DIR
cd nvm
VERSION=`git describe --abbrev=0 --tags`
git checkout master
git reset --hard $VERSION
cd ..
fpm -f -s dir -t deb -n nvm -v $VERSION -x $CHECKOUT_DIR/test -x $CHECKOUT_DIR/'*.md' -x $CHECKOUT_DIR/Makefile -x $CHECKOUT_DIR/.git -x $CHECKOUT_DIR/'.*' --prefix=$PREFIX nvm
