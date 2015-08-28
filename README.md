# server-genesis
One server to build your main infra pieces on CentOS 6

Puppet, Foreman, DNS, DHCP, TFTP, repos over http

Build this on a laptop which has inet access.

Then plug into a network at DC with no inet access and it is capable 
of building pulling code from git and building all hosts with puppet.

You connect over vpn with portable KVM

Put MAC addresses of the physical host into the DHCP leases. 



