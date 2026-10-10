#!/bin/sh

ping -c 3 10.8.47.2
ssh -o ConnectTimeout=5 root@10.8.47.2
curl -m 5 http://10.8.47.3
