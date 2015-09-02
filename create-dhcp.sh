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

# Subnet settings - for single subnet
subnet $GENESIS_SUBNET netmask $GENESIS_NETMASK {
    next-server $GENESIS_IP;
    filename "pxelinux.0";
    option domain-name-servers $DNS_IP;
}

host ${PUPPET_SERVER} {
   option host-name "${PUPPET_SERVER}";
   hardware ethernet $PUPPET_MAC;
   fixed-address $PUPPET_IP;
}

host ${FOREMAN_SERVER} {
   option host-name "${FOREMAN_SERVER}";
   hardware ethernet $FOREMAN_MAC;
   fixed-address $FOREMAN_IP;
}

host ${PULP_SERVER} {
   option host-name "${PULP_SERVER}";
   hardware ethernet $PULP_MAC;
   fixed-address $PULP_IP;
}

host ${DNS_SERVER} {
   option host-name "${DNS_SERVER}";
   hardware ethernet $DNS_MAC;
   fixed-address $DNS_IP;
}

host ${KICK_SERVER} {
   option host-name "${KICK_SERVER}";
   hardware ethernet $KICK_MAC;
   fixed-address $KICK_IP;
}


EOF

chkconfig dhcpd on
service dhcpd start
