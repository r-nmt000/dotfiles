#!/bin/sh
cd ./bin
curdir=`pwd`
for i in *
do
  sudo ln -snf "$curdir"/"$i" /usr/local/bin/"$i"
done
