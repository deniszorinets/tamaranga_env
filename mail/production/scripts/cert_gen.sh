#bin/sh

mkdir /etc/cert

openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
    -subj "/C=${CERT_COUNTRY}/ST=${CERT_STATE}/L=${CERT_CITY}/O=${CERT_COMPANY}/CN=${CERT_DOMAIN}" \
    -keyout /etc/cert/${CERT_DOMAIN}.key  -out /etc/cert/${CERT_DOMAIN}.cert

openssl req -new -newkey rsa:4096 -key /etc/cert/${CERT_DOMAIN}.key \
    -out /etc/cert/${CERT_DOMAIN}.csr \
    -subj "/C=${CERT_COUNTRY}/ST=${CERT_STATE}/L=${CERT_CITY}/O=${CERT_COMPANY}/CN=${CERT_DOMAIN}"

cat >> /etc/postfix/main.cf <<EOL
smtpd_use_tls = yes
smtp_tls_security_level = may
smtpd_tls_auth_only = yes
smtpd_tls_key_file = /etc/cert/${CERT_DOMAIN}.key
smtpd_tls_cert_file = /etc/cert/${CERT_DOMAIN}.cert
smtpd_tls_CAfile = /etc/cert/${CERT_DOMAIN}.csr
smtpd_tls_loglevel = 3
smtpd_tls_received_header = yes
smtpd_tls_session_cache_timeout = 3600s
tls_random_source = dev:/dev/urandom
EOL