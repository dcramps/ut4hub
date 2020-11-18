#!/bin/bash
cd /lib/x86_64-linux-gnu/
ln -s libssl.so.1.1 libssl.so.1.0.0
ln -s libcrypto.so.1.1 libcrypto.so.1.0.0
mkdir /config
