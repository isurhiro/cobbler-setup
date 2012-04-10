#!/bin/sh

RTN=`cobbler check`

if [ ${RTN} == "httpd does not appear to be running and proxying cobbler" ];then
  telnet localhost 25151
  echo $?
fi

cat << EOT
確認項目：

/etc/hosts/ のlocalhostの設定
/etc/sysconfig/network のIPv6の設定
EOT
