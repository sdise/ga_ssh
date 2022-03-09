
#!/bin/bash
#
echo "install epel elrepo"
sleep 1s
yum install epel-release elrepo-release -y && yum update -y

echo "install python pip nginx vim wget curl"
sleep 1s
yum install python3 python3-pip git nginx vim wget curl screen -y

echo "update sysytem kenerl forom elrepo-ml"
sleep 1s
yum --enablerepo=elrepo-kernel install kernel-ml -y &&grub2-set-default 0 &&grub2-mkconfig -o /boot/grub2/grub.cfg

echo "download CFwarp.sh to wg.sh v2ry-agent.sh to xray.sh"
sleep 1s
wget https://raw.githubusercontent.com/sdise/onekeyscrypts/main/warp.sh && bash warp.sh d
wget -N --no-check-certificate "https://raw.githubusercontent.com/sdise/onekeyscrypts/main/xray.sh" -O xray.sh

echo "open bbr"
sleep 1s
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf                                                                    
#vimrc
wget  https://raw.githubusercontent.com/sdise/onekeyscripts/main/.vimrc -O $HOME/.vimrc                                   
sleep 10s
timedatectl set-timezone Asia/Shangha
echo "### 运行完成 ###"
#read isreboot
echo "3秒后自动重启"
sleep 3s
reboot
