
#!/bin/bash
#
echo "install epel elrepo"
sleep 2s
yum install epel-release elrepo-release -y && yum update -y

echo "install python pip nginx vim wget curl"
sleep 1s
yum install python3 python3-pip git nginx vim wget curl screen -y

echo "update sysytem kenerl forom elrepo-ml"
sleep 3s
yum --enablerepo=elrepo-kernel install kernel-ml -y &&grub2-set-default 0 &&grub2-mkconfig -o /boot/grub2/grub.cfg

echo "download CFwarp.sh to wg.sh v2ry-agent.sh to xray.sh"
sleep 2s
wget -O wg.sh https://cdn.jsdelivr.net/gh/kkkyg/CFwarp/CFwarp.sh
wget -N --no-check-certificate "https://raw.githubusercontent.com/sdise/onekeyscrypts/main/xray.sh" -O xray.sh

echo "open bbr"
sleep 1s
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf                                                                    
#vimrc
wget  https://raw.githubusercontent.com/sdise/onekeyscripts/main/.vimrc -O $HOME/.vimrc                                   
sleep 10s
echo "### 运行完成 ###"
#read isreboot
echo "30秒后自动重启"
sleep 30s
reboot
