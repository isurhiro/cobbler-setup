#!/bin/sh

rpm -Uhv http://download.fedora.redhat.com/pub/epel/6/x86_64/epel-release-6-5.noarch.rpm
yes | yum install -y cobbler dhcp bind caching-nameserver syslinux


