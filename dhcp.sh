source /root/server-genesis/genesis.properties

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


