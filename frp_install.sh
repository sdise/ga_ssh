#!/bin/bash
sudo apt install nginx python3 python3-pip curl wget telnet tar gzip-y

cd ~
curl https://github.com/fatedier/frp/releases/download/v0.36.2/frp_0.36.2_linux_amd64.tar.gz && tar -zxf *gz && rm *gz && mv frp* frp

curl https://raw.githubusercontent.com/sdise/ga_ssh/main/frpc.ini -o ~/frp/frpc.ini

sudo pip3 install https://github.com/shadowsocks/shadowsocks/archive/master.zip

curl https://raw.githubusercontent.com/sdise/ga_ssh/main/ss.json ./

sudo ssserver -c ~/ss.json -d start
