#!/bin/sh


perl -i.bk -pe 's|.*disable.*|\tdisable\t\t\t= no|' /etc/xinetd.d/{tftp,rsync}
for i in /etc/xinetd.d/{tftp,rsync};do diff $i{.bk,};done
rm -f /etc/xinetd.d/{tftp,rsync}.bk
service xinetd start && chkconfig xinetd on
