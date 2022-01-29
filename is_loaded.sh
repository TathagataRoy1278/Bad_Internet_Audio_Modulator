#!/bin/sh

MODULE="$1"

if lsmod | grep "$MODULE" &> /dev/null ; then
    echo "$MODULE is loaded!"
    exit 0
else
    echo "$MODULE is not loaded!"
    exit 1
    fi
