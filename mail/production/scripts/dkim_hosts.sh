#/bin/sh

echo 127.0.0.1 >> /etc/opendkim/TrustedHosts

for h in ${MAIL_DOMAIN}; do

    if [ ! -f /var/db/dkim/${MAIL_DOMAIN}/default.private ]; then
        if [ ! -d /var/db/dkim/${MAIL_DOMAIN} ]; then
            mkdir /var/db/dkim/${MAIL_DOMAIN}
        fi
        opendkim-genkey -D /var/db/dkim/${MAIL_DOMAIN}/ -d ${MAIL_DOMAIN} -s default
    fi

    echo ${MAIL_DOMAIN} >> /etc/opendkim/TrustedHosts
    echo default._domainkey.${MAIL_DOMAIN} ${MAIL_DOMAIN}:default:/var/db/dkim/${MAIL_DOMAIN}/default.private > /etc/opendkim/KeyTable
    echo *@${MAIL_DOMAIN} default._domainkey.${MAIL_DOMAIN} > /etc/opendkim/SigningTable
done

for h in ${SENDER_HOST}; do
    echo ${SENDER_HOST} >> /etc/opendkim/TrustedHosts
done


chown -R opendkim:opendkim /var/db/dkim
