#!/bin/bash
# Tool name: C2Blocker - C2 Servers blocker in network
# Written by: KsrvcO
# Version: 1.0
# Tested on: Linux based systems
# This tool can be running as system service on linux servers and also can be running on linux systems as gateway.
# This tool created as a feature of one of the our project.
touch /var/log/c2server-blocked.log
while (true)
do
mkdir -p /opt/c2blocker
online_c2_servers="https://urlhaus.abuse.ch/downloads/text_online/"
ourpath="/opt/c2blocker"
curl --silent $online_c2_servers > $ourpath/c2servers-temp.lst
cat $ourpath/c2servers-temp.lst  | \
cut -d "/" -f3 | \
cut -d ":" -f1 | \
sort -u > $ourpath/c2servers.lst
for i in $(cat $ourpath/c2servers.lst)
do
iptables -t filter -C OUTPUT -p all -m comment --comment "C2ServerBlocker" -d $i -j DROP || iptables -t filter -I OUTPUT -p all -m comment --comment "C2ServerBlocker" -d $i -j DROP
done
/usr/sbin/iptables-save | grep "C2ServerBlocker" | awk '{ print $4 }' | cut -d "/" -f1 | sort -u >> $ourpath/temp-blocked.txt
cat $ourpath/temp-blocked.txt | sort -u > /var/log/c2server-blocked.log
rm -rf $ourpath
done
exit