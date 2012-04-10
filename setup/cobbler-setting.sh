#!/bin/sh

if [ ${#} -eq 1 ]; then
  SECRET_NETWORK=$1
elif [ ${#} -eq 0 ]; then
  SECRET_NETWORK=192.168.100.100
else
  cat << EOT
usage1: $0 ip
usage2: $0
   ip is default(192.168.100.100)
EOT
  exit
fi


perl -i.bk -pe "s|127\.0\.0\.1|${SECRET_NETWORK}|" /etc/cobbler/settings
diff /etc/cobbler/settings{.bk,}
perl -i.bk -pe 's|manage_dhcp: 0|manage_dhcp: 1|' /etc/cobbler/settings
diff /etc/cobbler/settings{.bk,}

rm -f /etc/cobbler/settings.bk


service cobblerd start && chkconfig cobblerd on
service httpd start && chkconfig httpd on

cobbler check
