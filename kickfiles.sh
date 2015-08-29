source /root/server-genesis/genesis.properties

for I in ${PUPPET_SERVER} ${FOREMAN_SERVER} ${PULP_SERVER} ${DNS_SERVER} ${KICK_SERVER} ; do
  cp -f /root/server-genesis/example001.ks ${HTTP_ROOT}/${I}-ks
done

