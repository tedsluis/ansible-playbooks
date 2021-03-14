declare -x OVPN_AUTH=
declare -x OVPN_CIPHER=
declare -x OVPN_CLIENT_TO_CLIENT=
declare -x OVPN_CN={{_openvpn_fqdn}}
declare -x OVPN_COMP_LZO=0
declare -x OVPN_DEFROUTE=0
declare -x OVPN_DEVICE=tun
declare -x OVPN_DEVICEN=0
declare -x OVPN_DISABLE_PUSH_BLOCK_DNS=1
declare -x OVPN_DNS=1
declare -x OVPN_DNS_SERVERS=([0]="{{_openvpn_dns_server}}")
declare -x OVPN_ENV=/etc/openvpn/ovpn_env.sh
declare -x OVPN_EXTRA_CLIENT_CONFIG=()
declare -x OVPN_EXTRA_SERVER_CONFIG=()
declare -x OVPN_FRAGMENT=
declare -x OVPN_KEEPALIVE='10 60'
declare -x OVPN_MTU=
declare -x OVPN_NAT=1
declare -x OVPN_PORT=1194
declare -x OVPN_PROTO=udp
declare -x OVPN_PUSH=([0]="route 192.168.1.0 255.255.255.0" [1]="route 10.88.0.0 255.255.0.0")
declare -x OVPN_ROUTES=([0]="192.168.1.0/24")
declare -x OVPN_SERVER=192.168.255.0/24
declare -x OVPN_SERVER_URL=udp://{{_openvpn_fqdn}}
declare -x OVPN_TLS_CIPHER=
