echo INSTALL PACKAGES
yum install dhcp syslinux tftp-server xinetd httpd vim -y

echo HTTP MEDIA SETUP - MOUNTED ONLY
mkdir -p ${DROOT}/{${KSDIR},${PACKDIR}}
mount -o loop /dev/cdrom  ${DROOT}/${PACKDIR} || echo Looks like cdrom is already mounted
systemctl enable httpd.service
systemctl restart httpd.service
