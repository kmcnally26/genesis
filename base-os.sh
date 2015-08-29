source /root/server-genesis/genesis.properties

yum install -y $PACKAGES

cat << EOF > /etc/hosts
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
$IPADDRESS $SERVERNAME ${SERVERNAME%%.*}

EOF

cat << EOF > /etc/hostname
NETWORKING=yes
HOSTNAME=$SERVERNAME

EOF

cat << EOF > /etc/sysconfig/network-scripts/ifcfg-eth0
DEVICE=eth0
TYPE=Ethernet
ONBOOT=yes
BOOTPROTO=static
IPADDR=192.168.136.100
GATEWAY=192.168.136.2
NETMASK=255.255.255.0

EOF

cat << EOF > /etc/resolv.conf
nameserver 192.168.136.2

EOF
