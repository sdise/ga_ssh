#!/bin/bash

sleep 10s

SERVER_ADDR = "$SERVER_ADDR"
SERVER_PORT = "$SERVER_PORT"
sudo su runner
cd /home/runner

sudo apt install nginx python3 python3-pip curl wget telnet tar gzip -y

cd /home.runner 
wget https://github.com/fatedier/frp/releases/download/v0.36.2/frp_0.36.2_linux_amd64.tar.gz -P /home/runner
cd /home/runner
sudo chmod 755 /home/runner/frp_0.36.2_linux_amd64.tar.gz
tar -zxf *gz && rm *gz* && mv frp* frp

curl https://raw.githubusercontent.com/sdise/ga_ssh/main/frpc.ini -o /home/runner/frp/frpc.ini

sudo chmod 755 /home/runner/frp/frpc
 
bash /home/runner/frp/frpc -c /home/runner/frp/frpc.ini &

sudo pip3 install https://github.com/shadowsocks/shadowsocks/archive/master.zip

wget https://raw.githubusercontent.com/sdise/ga_ssh/main/ss.json && mv ss.json /home/runner/

sudo ssserver -c /home/runner/ss.json -d start &
