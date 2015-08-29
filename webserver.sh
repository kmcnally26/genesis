source /root/server-genesis/genesis.properties

yum install httpd -y
mv /etc/httpd/conf.d/welcome.conf{,.off}

mkdir /var/www/html/centos-6
iso=CentOS-6.6-x86_64-minimal.iso
#mount -o loop $iso /var/www/html/centos-6

chkconfig httpd on
service httpd start


