#!/bin/sh

if [ ${#} -eq 1 ]; then
  DHCP_NETWORK=$1
elif [ ${#} -eq 0 ]; then
  DHCP_NETWORK=192.168.100.0
else 
  cat << EOT
usage1: $0 network
usage2: $0
   network is default(192.168.100.0)
EOT
  exit
fi

iptables -t nat -A POSTROUTING -s ${DHCP_NETWORK}/255.255.255.0 -j MASQUERADE
iptables-save

service iptables start

#echo 1 > /proc/sys/net/ipv4/ip_forward
sysctrl -w net.ipv4.ip_forward=1
