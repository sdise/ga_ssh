#!/bin/bash

sleep 10s

sudo su runner
cd /home/runner

sudo apt install nginx python3 python3-pip curl wget telnet tar gzip -y

cd /home.runner && wget https://github.com/fatedier/frp/releases/download/v0.36.2/frp_0.36.2_linux_amd64.tar.gz && tar -zxf *gz && rm *gz* && mv frp* frp

curl https://raw.githubusercontent.com/sdise/ga_ssh/main/frpc.ini -o ~/frp/frpc.ini

sudo chmod 755 ~/frp/frpc
 
 ./home/runner/frp/frpc -c /home/runner/frp/frpc.ini

sudo pip3 install https://github.com/shadowsocks/shadowsocks/archive/master.zip

wget https://raw.githubusercontent.com/sdise/ga_ssh/main/ss.json && mv ss.json /home/runner/

sudo ssserver -c ~/ss.json -d start

echo "script used"
