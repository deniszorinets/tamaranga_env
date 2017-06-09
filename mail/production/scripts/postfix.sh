#/bin/sh
opendkim -x /etc/opendkim/opendkim.conf
/usr/sbin/postfix start
tail -f /var/log/maillog