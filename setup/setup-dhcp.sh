#!/bin/sh


SECRET_NETWORK=192.168.100.100
DHCP_NETWORK=192.168.100.0

perl -i.bk -pe "s|192\.168\.1\.5|${SECRET_NETWORK}|" /etc/cobbler/dhcp.template
diff -u /etc/cobbler/dhcp.template{.bk,}
perl -i.bk -pe "s|subnet 192\.168\.1\.0|subnet 192.168.100.0|" /etc/cobbler/dhcp.template
diff -u /etc/cobbler/dhcp.template{.bk,}

perl -i.bk -pe "s|192\.168\.1\.100|192.168.100.100|" /etc/cobbler/dhcp.template
perl -i.bk -pe "s|192\.168\.1\.254|192.168.100.254|" /etc/cobbler/dhcp.template
diff -u /etc/cobbler/dhcp.template{.bk,}
rm -f /etc/cobbler/dhcp.template.bk

