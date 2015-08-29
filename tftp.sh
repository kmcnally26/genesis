source /root/server-genesis/genesis.properties

yum install dhcp syslinux tftp-server xinetd httpd vim -y

cp /usr/share/syslinux/pxelinux.0 /var/lib/tftpboot/
cp /usr/share/syslinux/menu.c32 /var/lib/tftpboot/
mkdir -p /var/lib/tftpboot/{boot,pxelinux.cfg}
cp  ${DROOT}/${PACKDIR}/images/pxeboot/vmlinuz  /var/lib/tftpboot/boot/${DISTRO}-vmlinuz
cp  ${DROOT}/${PACKDIR}/images/pxeboot/initrd.img  /var/lib/tftpboot/boot/${DISTRO}-initrd.img
cat << EOF > /var/lib/tftpboot/pxelinux.cfg/default
DEFAULT ${DISTRO}
LABEL ${DISTRO}
    KERNEL boot/${DISTRO}-vmlinuz
    APPEND initrd=boot/${DISTRO}-initrd.img inst.ks=http://${MYIP}/${KSDIR}/\${1}-ks devfs=nomount ip=dhcp
EOF
sed 's/disable[ \t=]*yes/disable     = no/' /etc/xinetd.d/tftp -i
