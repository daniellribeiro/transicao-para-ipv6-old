touch tayga.conf
echo tun-device nat64 > tayga.conf
echo ipv4-addr 192.168.255.1 > tayga.conf
echo prefix 2001:db8:ca00::/96 > tayga.conf
echo dynamic-pool 192.168.255.0/24 > tayga.conf
echo data-dir /tmp > tayga.conf
echo map 192.168.255.100 2001:db8:ca5a:2::2 > tayga.conf
tayga --mktun
ip link set nat64 up
ip route add 192.168.255.0/24 dev nat64
ip -6 route add 2001:db8:ca00::/96 dev nat64
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -A FORWARD -i eth0 -o nat64 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i nat64 -o eth0 -j ACCEPT
tayga -d -c tayga.conf