HOSTNAME=`/sbin/ifconfig  | grep 192.168.1 | head -1 | cut -d: -f2 | cut -d ' ' -f1 | sha1sum  | cut -d ' ' -f 1 | cut -c 1-8`
echo -n $HOSTNAME
