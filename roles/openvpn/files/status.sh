#!/usr/bin/bash

# from docker_openvpn /var/lib/openvpn/status/openvpn-status.log
# OpenVPN CLIENT LIST
# Updated,2021-03-14 16:09:13
# Common Name,Real Address,Bytes Received,Bytes Sent,Connected Since
# tedsluis-nopass,192.168.1.31:42356,95918,233324,2021-03-14 15:50:05
# ROUTING TABLE
# Virtual Address,Common Name,Real Address,Last Ref
# 192.168.255.6,tedsluis-nopass,192.168.1.31:42356,2021-03-14 16:06:52
# GLOBAL STATS
# Max bcast/mcast queue length,1
# END

# for openvpn_exporter /var/lib/openvpn/status/status
# TITLE,OpenVPN
# TIME,2021-03-14 15:51:06,1615733466
# HEADER,CLIENT_LIST,Common Name,Real Address,Virtual Address,Bytes Received,Bytes Sent,Connected Since,Connected Since (time_t),Username
# CLIENT_LIST,tedsluis-nopass,192.168.1.31:42356,192.168.1.31,10616,9891,2021-03-14 15:50:05,1615733405,UNDEV
# HEADER,ROUTING_TABLE,Virtual Address,Common Name,Real Address,Last Ref,Last Ref (time_t)
# ROUTING_TABLE,192.168.255.6,tedsluis-nopass,192.168.1.31:42356,2021-03-14 15:50:57,1615733457
# GLOBAL_STATS,Max bcast/mcast queue length,1
# END

if [[ ! -f /var/lib/openvpn/status/openvpn-status.log ]]; then
     exit
fi

echo "TITLE,OpenVPN" > /var/lib/openvpn/status/status.tmp
grep -P '^Updated' /var/lib/openvpn/status/openvpn-status.log | sed 's/Updated/TIME/g' >> /var/lib/openvpn/status/status.tmp
echo "HEADER,CLIENT_LIST,Common Name,Real Address,Virtual Address,Bytes Received,Bytes Sent,Connected Since,Connected Since (time_t),Username" >> /var/lib/openvpn/status/status.tmp
sed -n '/^Common Name/,$p' /var/lib/openvpn/status/openvpn-status.log | sed '/^ROUTING/q' | grep -vP '^(ROUTING|Common)' | sed 's/^/CLIENT_LIST,/' | sed -r 's/([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+):([0-9]+),/\1:\2,\1,/' >> /var/lib/openvpn/status/status.tmp
echo "HEADER,ROUTING_TABLE,Virtual Address,Common Name,Real Address,Last Ref,Last Ref (time_t)" >> /var/lib/openvpn/status/status.tmp
sed -n '/^Virtual Address/,$p' /var/lib/openvpn/status/openvpn-status.log | sed '/^GLOBAL STATS/q' | grep -vP '^(Virtual|GLOBAL\sSTATS)' | sed 's/^/ROUTING_TABLE,/' >> /var/lib/openvpn/status/status.tmp
grep -P 'Max bcast/mcast' /var/lib/openvpn/status/openvpn-status.log | sed 's/^/GLOBAL_STATS,/' >> /var/lib/openvpn/status/status.tmp
echo "END" >> /var/lib/openvpn/status/status.tmp
if [[ -f "/var/lib/openvpn/status/status.tmp2" ]]; then
     rm /var/lib/openvpn/status/status.tmp2
fi
touch /var/lib/openvpn/status/status.tmp2
chmod 777 /var/lib/openvpn/status/status.tmp2
while IFS= read -r i; do 
     # 2021-03-13 21:44:00 -> epoch
     if [[ $i =~ ,([0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}) ]]; then
          echo "$i,$(date --date="${BASH_REMATCH[1]}" +"%s")" | grep -P '^CLIENT_LIST' | sed 's/$/,UNDEV/' >> /var/lib/openvpn/status/status.tmp2
          echo "$i,$(date --date="${BASH_REMATCH[1]}" +"%s")" | grep -vP '^CLIENT_LIST' >> /var/lib/openvpn/status/status.tmp2
     else 
          echo "$i" >> /var/lib/openvpn/status/status.tmp2
     fi; 
done </var/lib/openvpn/status/status.tmp
cp /var/lib/openvpn/status/status.tmp2 /var/lib/openvpn/status/status

