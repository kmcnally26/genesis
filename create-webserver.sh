source /root/server-genesis/genesis.properties

yum install httpd -y
mv /etc/httpd/conf.d/welcome.conf{,.off}

mkdir ${HTTP_CENTOS}
iso=CentOS-6.6-x86_64-minimal.iso
#mount -o loop $iso ${HTTP_CENTOS}

chkconfig httpd on
service httpd start


