FROM hwdsl2/ipsec-vpn-server
RUN sed -i '/^# Create IPTables rules/a iptables -t nat -A PREROUTING -d 192.168.42.3 -j DNAT --to-destination 172.28.1.1' /opt/src/run.sh