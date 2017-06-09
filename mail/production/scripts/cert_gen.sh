#bin/sh

mkdir /etc/cert

openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
    -subj "/C=${CERT_COUNTRY}/ST=${CERT_STATE}/L=${CERT_CITY}/O=${CERT_COMPANY}/CN=${MAIL_DOMAIN}" \
    -keyout /etc/cert/${MAIL_DOMAIN}.key  -out /etc/cert/${MAIL_DOMAIN}.cert

openssl req -new -newkey rsa:4096 -key /etc/cert/${MAIL_DOMAIN}.key \
    -out /etc/cert/${MAIL_DOMAIN}.csr \
    -subj "/C=${CERT_COUNTRY}/ST=${CERT_STATE}/L=${CERT_CITY}/O=${CERT_COMPANY}/CN=${MAIL_DOMAIN}"

cat >> /etc/postfix/main.cf <<EOL
smtpd_use_tls = yes
smtp_tls_security_level = may
smtpd_tls_auth_only = yes
smtpd_tls_key_file = /etc/cert/${MAIL_DOMAIN}.key
smtpd_tls_cert_file = /etc/cert/${MAIL_DOMAIN}.cert
smtpd_tls_CAfile = /etc/cert/${MAIL_DOMAIN}.csr
smtpd_tls_loglevel = 3
smtpd_tls_received_header = yes
smtpd_tls_session_cache_timeout = 3600s
tls_random_source = dev:/dev/urandom
EOL