#!/bin/sh

ROL="$1"

case "$ROL" in
  user1-1)    IP="10.8.46.2/25";   GW="10.8.46.1" ;;
  user1-2)    IP="10.8.46.130/25"; GW="10.8.46.129" ;;
  webserver)  IP="10.8.47.2/28";   GW="10.8.47.1" ;;
  inventario) IP="10.8.47.3/28";   GW="10.8.47.1" ;;
  db)         IP="10.8.47.4/28";   GW="10.8.47.1" ;;
  *)
    echo "Uso: $0 <user1-1|user1-2|webserver|inventario|db>"
    exit 1 ;;
esac

ip addr add "$IP" dev eth0 2>/dev/null
ip link set eth0 up
ip route add default via "$GW" 2>/dev/null

if [ "$ROL" = "webserver" ]; then
  mkdir -p /run/sshd
  /usr/sbin/sshd
fi

ip addr show eth0
ip route
