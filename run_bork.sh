#!/bin/sh

echo $1
echo "$1"
echo 'wokr?'

if [ "$1" != "" ]; then
  BORK_OPERATION=$1
else
  BORK_OPERATION=status
fi
if [ -d "./bork" ]; then
  for borkfile in ./bork/*.sh; do
    bork $BORK_OPERATION $borkfile
  done
fi
