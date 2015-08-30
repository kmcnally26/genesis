# This is settings for when genesis is plugged into DC and not for building with inet connection

source /root/server-genesis/genesis.properties

yum install -y $PACKAGES  # see genesis.properties

cat << EOF > /etc/hosts
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
$GENESIS_IP $GENESIS_SERVER ${GENESIS_SERVER%%.*}

EOF

cat << EOF > /etc/hostname
NETWORKING=yes
HOSTNAME=$GENESIS_SERVER

EOF

cat << EOF > /etc/sysconfig/network-scripts/ifcfg-eth0
DEVICE=eth0
TYPE=Ethernet
ONBOOT=yes
BOOTPROTO=static
IPADDR=$GENESIS_IP
NETMASK=$GENESIS_NETMASK

EOF

cat << EOF > /etc/resolv.conf
nameserver 192.168.136.2

EOF
