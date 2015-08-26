#!/bin/bash
#
# Desc: Build DHCP server.
# 
# Date: 2015-05-23
# Author: <kevin.mcnally@lastminute.com>
# System: RHEL6

# Verbose output.
set -x
# Exit if anything fails
set -e
# Uncomment for no output.
#exec > /dev/null

## Environment
RETVAL=0

MYIP=172.16.105.131
MYDOMAIN=example.com
DHCPSUBNET=172.16.105.0
DHCPMASK=255.255.255.0
NAMESERVER=172.16.105.131

echo DHCP SETUP
cat << EOF > /etc/dhcp/dhcpd.conf
# DHCP options
allow booting;
allow bootp;
omapi-port 7911;
option domain-name "${MYDOMAIN}";
option domain-name-servers ${NAMESERVER};
default-lease-time 600;
max-lease-time 7200;
ddns-update-style none;
authoritative;
log-facility local7;
# Subnet settings
subnet $DHCPSUBNET netmask $DHCPMASK {
    next-server $MYIP;
    filename "pxelinux.0";
    option domain-name-servers $NAMESERVER;
}
# Host declaration example
#host apex {
#   option host-name "apex.example.com";
#   hardware ethernet 00:A0:78:8E:9E:AA;
#   fixed-address 172.16.105.4;
#}
EOF

echo Downloading pxe-kick.sh
curl -sf -o /root/pxe-kick.sh -L -k https://raw.githubusercontent.com/kmcnally26/boot-strappers/master/pxe-kick.sh
chmod 755 /root/pxe-kick.sh

systemctl enable dhcpd.service
systemctl restart dhcpd.service

exit ${RETVAL}
# EOF
