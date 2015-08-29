# server-genesis


WHAT YOU NEED TO DELIVER?

# SERVER GENESIS PROJECT
# Base OS CentOS 6.7

# Server genesis is a laptop that can build your main infra pieces.
# Genesis is built manaually in the office with inet access, then in DC 
# with no maybe inet access kickstarts the main servers. 
# Main servers have inet access to puppet forge and repos.


# GITHUB REPO - https://github.com/kmcnally26/server-genesis.git

One server to kickstart your main infra pieces on CentOS 6

genesis server has kickstart pxe puppet repos

Then it builds Puppet, Foreman, DNS, Kickstart, pulp

Build this on a laptop which has inet access.

Then plug into a network at DC with no inet access and it is capable 
of building pulling code from git and building all hosts with puppet.

You connect over vpn with portable KVM

Put MAC addresses of the physical host into the DHCP leases. 



