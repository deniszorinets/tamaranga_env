#/bin/sh

echo default._domainkey.${MAIL_DOMAIN} ${MAIL_DOMAIN}:default:/var/db/dkim/${MAIL_DOMAIN}/default.private > /etc/opendkim/KeyTable
echo *@${MAIL_DOMAIN} default._domainkey.${MAIL_DOMAIN} > /etc/opendkim/SigningTable
echo 127.0.0.1 >> /etc/opendkim/TrustedHosts
echo ${MAIL_DOMAIN} >> /etc/opendkim/TrustedHosts
echo ${SENDER_HOST} >> /etc/opendkim/TrustedHosts

if [ ! -f /var/db/dkim/${MAIL_DOMAIN}/default.private ]; then
    if [ ! -d /var/db/dkim/${MAIL_DOMAIN} ]; then
        mkdir /var/db/dkim/${MAIL_DOMAIN}
    fi
    opendkim-genkey -D /var/db/dkim/${MAIL_DOMAIN}/ -d ${MAIL_DOMAIN} -s default
fi

chown -R opendkim:opendkim /var/db/dkim
