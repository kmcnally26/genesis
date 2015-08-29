source /root/server-genesis/genesis.properties

cp /usr/share/syslinux/pxelinux.0 /var/lib/tftpboot/
cp /usr/share/syslinux/menu.c32 /var/lib/tftpboot/
mkdir -p /var/lib/tftpboot/{boot,pxelinux.cfg}
cp  ${HTTP_CENTOS}/images/pxeboot/vmlinuz  /var/lib/tftpboot/boot/${DISTRO}-vmlinuz
cp  ${HTTP_CENTOS}/images/pxeboot/initrd.img  /var/lib/tftpboot/boot/${DISTRO}-initrd.img


cat << EOF > /var/lib/tftpboot/pxelinux.cfg/default
DEFAULT ${DISTRO}
LABEL ${DISTRO}
    KERNEL boot/${DISTRO}-vmlinuz
    APPEND initrd=boot/${DISTRO}-initrd.img inst.ks=http://${GENESIS_IP}/\${1}-ks devfs=nomount ip=dhcp
EOF
sed 's/disable[ \t=]*yes/disable     = no/' /etc/xinetd.d/tftp -i

chkconfig xinetd on
service xinetd start
