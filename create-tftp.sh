source /root/server-genesis/genesis.properties

## puppet server
cat << EOF > /var/lib/tftpboot/pxelinux.cfg/$( echo 01-${PUPPET_MAC,,} | sed 's/\:/\-/g')
DEFAULT linux
LABEL linux
    KERNEL boot/CentOS-6.7-x86_64-vmlinuz
    APPEND initrd=boot/CentOS-6.7-x86_64-initrd.img ks=http://${GENESIS_IP}/${PUPPET_SERVER}-ks ramdisk_size=100000 ksdevice=eth0

EOF

## foreman server
cat << EOF > /var/lib/tftpboot/pxelinux.cfg/$( echo 01-${FOREMAN_MAC,,} | sed 's/\:/\-/g')
DEFAULT linux
LABEL linux
    KERNEL boot/CentOS-6.7-x86_64-vmlinuz
    APPEND initrd=boot/CentOS-6.7-x86_64-initrd.img ks=http://${GENESIS_IP}/${FOREMAN_SERVER}-ks ramdisk_size=100000 ksdevice=eth0

EOF

## kickstart server
cat << EOF > /var/lib/tftpboot/pxelinux.cfg/$( echo 01-${KICK_MAC,,} | sed 's/\:/\-/g')
DEFAULT linux
LABEL linux
    KERNEL boot/CentOS-6.7-x86_64-vmlinuz
    APPEND initrd=boot/CentOS-6.7-x86_64-initrd.img ks=http://${GENESIS_IP}/${KICK_SERVER}-ks ramdisk_size=100000 ksdevice=eth0

EOF

## dns server
cat << EOF > /var/lib/tftpboot/pxelinux.cfg/$( echo 01-${DNS_MAC,,} | sed 's/\:/\-/g')
DEFAULT linux
LABEL linux
    KERNEL boot/CentOS-6.7-x86_64-vmlinuz
    APPEND initrd=boot/CentOS-6.7-x86_64-initrd.img ks=http://${GENESIS_IP}/${DNS_SERVER}-ks ramdisk_size=100000 ksdevice=eth0

EOF

## pulp server
cat << EOF > /var/lib/tftpboot/pxelinux.cfg/$( echo 01-${PULP_MAC,,} | sed 's/\:/\-/g')
DEFAULT linux
LABEL linux
    KERNEL boot/CentOS-6.7-x86_64-vmlinuz
    APPEND initrd=boot/CentOS-6.7-x86_64-initrd.img ks=http://${GENESIS_IP}/${PULP_SERVER}-ks ramdisk_size=100000 ksdevice=eth0

EOF


