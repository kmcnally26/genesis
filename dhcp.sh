source /root/server-genesis/genesis.properties

cat << EOF > /etc/dhcp/dhcpd.conf
# DHCP options
allow booting;
allow bootp;
omapi-port 7911;
option domain-name "${DOMAINNAME}";
option domain-name-servers ${GENESIS_IP};
default-lease-time 600;
max-lease-time 7200;
ddns-update-style none;
authoritative;
log-facility local7;
# Subnet settings
subnet $GENESIS_SUBNET netmask $GENESIS_NETMASK {
    next-server $GENESIS_IP;
    filename "pxelinux.0";
    option domain-name-servers $DNS_IP;
}

# Host declaration example
#host apex {
#   option host-name "apex.example.com";
#   hardware ethernet 00:A0:78:8E:9E:AA;
#   fixed-address 172.16.105.4;
#}

EOF

chkconfig dhcpd on
service dhcpd start
