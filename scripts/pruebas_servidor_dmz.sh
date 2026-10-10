#!/bin/sh

ping -c 3 10.8.47.1
ping -c 3 10.8.46.2
ping -c 3 8.8.8.8

nslookup archive.ubuntu.com
apt-get update
