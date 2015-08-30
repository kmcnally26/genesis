
# SERVER GENESIS PROJECT
## CentOS 6.7

Server genesis is a laptop that can build your main infra pieces. 
Genesis is built manaually in the office with inet access, then in DC 
with no maybe inet access, kickstarts the 4 main servers. 
Main servers have inet access to puppet forge and repos. 
Conifuring these is not part of this project.

Builds Puppet, Foreman, DNS, Kickstart, pulp

Build this on a laptop which has inet access.

At datacentre connect to genesis over vpn with portable KVM
Put MAC addresses of the 4 hosts and add to the genesis.properties file.

Update IP details to match whats in the DC network.



