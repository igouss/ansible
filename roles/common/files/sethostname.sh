OLD_HOSTNAME=`hostname`
NEW_HOSTNAME=`/sbin/ifconfig  | grep 192.168.1 | head -1 | cut -d: -f2 | cut -d ' ' -f1 | sha1sum  | cut -d ' ' -f 1 | cut -c 1-8`

if [ $OLD_HOSTNAME != $NEW_HOSTNAME ]
then
  hostnamectl set-hostname $NEW_HOSTNAME
  sed -i "s/$OLD_HOSTNAME/$NEW_HOSTNAME/g" /etc/hosts
  echo -n "new HOSTNAME=$NEW_HOSTNAME"
else
  echo -n "HOSTNAME unchanged"
fi

