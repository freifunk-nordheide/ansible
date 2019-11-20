#!/bin/bash
PEER_KEY=$1
PEER_ADDRESS=$2
BLACKLIST=$3
if /bin/grep -Fq $PEER_KEY $BLACKLIST; then
    echo "BANNED KEY: $PEER_KEY $PEER_ADDRESS"
    exit 1
else
    echo "CLEAN KEY: $PEER_KEY $PEER_ADDRESS"
    exit 0
fi
