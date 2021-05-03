#!/bin/bash

NGROK_TOKEN = "1s0xyOiXBi8I1kIhZD6ZIqLmPLc_7WsLXA1jGWCiTbQyVL5iZ"
 
if [[ -z "$NGROK_TOKENGROK_TOKENN" ]]; then
  echo "Please set 'NGROK_TOKEN'"
  exit 2
fi
 
if [[ -z "$USER_PASS" ]]; then
  echo "Please set 'USER_PASS' for user: $USER"
  exit 3
fi
 
echo "### Install ngrok ###"
 
wget -q https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip
unzip ngrok-stable-linux-386.zip
chmod +x ./ngrok
 
echo "### Update user: $USER password ###"
echo -e "$USER_PASS\n$USER_PASS" | sudo passwd "$USER"
 
echo "### Start ngrok proxy for 22 port ###"
 
 
rm -f .ngrok.log
./ngrok authtoken "$NGROK_TOKEN"
./ngrok tcp 22 --log ".ngrok.log" &
touch /tmp/keepalive
 
sleep 1
HAS_ERRORS=$(grep "command failed" < .ngrok.log)
 
if [[ -z "$HAS_ERRORS" ]]; then
  echo ""
  echo "=========================================="
  echo "To connect: $(grep -o -E "tcp://(.+)" < .ngrok.log | sed "s/tcp:\/\//ssh $USER@/" | sed "s/:/ -p /")"
  echo "=========================================="
else
  echo "$HAS_ERRORS"
  exit 4
fi

curl https://raw.githubusercontent.com/sdise/ga_ssh/main/frp_install.sh && sudo chmod +x frp_install.sh && sudo bash frp_install.sh
