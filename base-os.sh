#!/bin/bash
#
# Desc: Configure the OS.
# Does not requires INET access
# Date: 2015-05-23
# Author: <kevin.mcnally@lastminute.com>
# System: RHEL6

# Verbose output.
set -x
# Exit if anything fails
set -e
# Uncomment for no output.
#exec > /dev/null

## Environment
RETVAL=0

## Set host detail here
MYIP=172.16.105.131
MYHOSTNAME=freeipa001
MYDOMAIN=example.com
FQDN=$MYHOSTNAME.$MYDOMAIN

## Set DHCP
DHCPSUBNET=172.16.105.0
DHCPMASK=255.255.255.0
NAMESERVER=172.16.105.131

## Set distro and HTTP
DISTRO='CentOS-7.0-1406-x86_64'
KSDIR=kickstart
PACKDIR=centos 
DROOT=/var/www/html 


echo Disable firewall and SElinux
  if !( grep 'SELINUX=disabled' /etc/sysconfig/selinux ); then
    sed 's/SELINUX=[a-z]*/SELINUX=disabled/' /etc/sysconfig/selinux -i
  fi
  setenforce 0
  
  systemctl disable firewalld && systemctl stop firewalld && iptables -F

## Check network and hostname

cat << EOF > /etc/hosts
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
$MYIP $FQDN $MYHOSTNAME

EOF

cat << EOF > /etc/hostname
$FQDN

EOF
