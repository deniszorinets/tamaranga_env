#/bin/sh

echo 127.0.0.1 >> /etc/opendkim/TrustedHosts

for h in ${MAIL_DOMAIN}; do

    if [ ! -f /var/db/dkim/${h}/default.private ]; then
        if [ ! -d /var/db/dkim/${h} ]; then
            mkdir /var/db/dkim/${h}
        fi
        opendkim-genkey -D /var/db/dkim/${h}/ -d ${h} -s default
    fi

    echo ${h} >> /etc/opendkim/TrustedHosts
    echo default._domainkey.${h} ${h}:default:/var/db/dkim/${h}/default.private > /etc/opendkim/KeyTable
    echo *@${h} default._domainkey.${h} > /etc/opendkim/SigningTable
done

for h in ${SENDER_HOST}; do
    echo ${h} >> /etc/opendkim/TrustedHosts
done


chown -R opendkim:opendkim /var/db/dkim
