install 
text
unsupported_hardware 
url --url http://172.16.105.100/centos-6/

lang en_US.UTF-8
keyboard uk

network --onboot yes --device eth0 --bootproto dhcp --noipv6 --hostname ${1}

rootpw  password
firewall --disabled
authconfig --enableshadow --passalgo=sha512
selinux --disabled
timezone --utc Europe/London

bootloader --location=mbr --driveorder=sda 
zerombr yes
clearpart --all

part /boot --fstype=ext4 --size=500
part pv.1 --grow --size=1

volgroup vg_1 --pesize=4096 pv.1
logvol / --fstype=ext4 --name=lv_root --vgname=vg_1 --grow --size=1024 --maxsize=51200
logvol swap --name=lv_swap --vgname=vg_1 --grow --size=1024 --maxsize=1024

reboot

%packages --ignoremissing
@base
@core

%end

%post --nochroot
exec < /dev/tty3 > /dev/tty3
#changing to VT 3 so that we can see whats going on....
/usr/bin/chvt 3
(
cp -va /etc/resolv.conf /mnt/sysimage/etc/resolv.conf
/usr/bin/chvt 1
) 2>&1 | tee /mnt/sysimage/root/install.postnochroot.log
%end

%post
exec < /dev/tty3 > /dev/tty3
#changing to VT 3 so that we can see whats going on....
/usr/bin/chvt 3
(

echo Executing script

sync
) 2>&1 | tee /root/install.post.log
%end

