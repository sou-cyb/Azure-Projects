# to flush NAT tables
iptables -t nat -F

# to allow other students to access APACHE server 
iptables -t nat -A PREROUTING -p tcp --dport 1818 -j DNAT --to-destination 172.17.18.37:80

# to allow other students to access MySQL server 
iptables -t nat -A PREROUTING -p tcp --dport 1618 -j DNAT --to-destination 172.17.18.37:3306

# to allow other students to access Linux server - SSH 
iptables -t nat -A PREROUTING -p tcp --dport 1218 -j DNAT --to-destination 172.17.18.37:22

# to allow other students to access IIS server 
iptables -t nat -A PREROUTING -p tcp --dport 1918 -j DNAT --to-destination 172.17.18.36:80

# to allow other students to access Windows server - RDP 
iptables -t nat -A PREROUTING -p tcp --dport 1318 -j DNAT --to-destination 172.17.18.36:3389

# to allow post routing
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE