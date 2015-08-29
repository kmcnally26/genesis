source /root/server-genesis/genesis.properties

## puppet server
cat << EOF > /var/lib/tftpboot/pxelinux.cfg/$( echo 01-${PUPPET_MAC,,} | sed 's/\:/\-/g')
DEFAULT linux
LABEL linux
    KERNEL boot/CentOS-6.7-x86_64-vmlinuz
    APPEND initrd=boot/CentOS-6.7-x86_64-initrd.img inst.ks=http://${GENESIS_IP}/${PUPPET_SERVER}-ks devfs=nomount ip=dhcp

EOF
