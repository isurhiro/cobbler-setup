#!/bin/sh


yum install -y cobbler-web pykickstart cman

echo -n "
run next:

patch < etc_cobbler_modules.conf.patch
htdigest /etc/cobbler/users.digest "Cobbler" cobbleradm
"
