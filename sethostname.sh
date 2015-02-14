OLD_HOSTNAME=`hostname`
NEW_HOSTNAME=`/sbin/ifconfig  | grep 192.168.1 | head -1 | cut -d: -f2 | cut -d ' ' -f1 | sha1sum  | cut -d ' ' -f 1 | cut -c 1-8`

hostnamectl set-hostname $NEW_HOSTNAME
sed -i "s/$OLD_HOSTNAME/$NEW_HOSTNAME/g" /etc/hosts
