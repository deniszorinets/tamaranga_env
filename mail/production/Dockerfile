FROM alpine:latest

RUN apk --update add postfix supervisor rsyslog opendkim opendkim-utils \
    && mkdir /run/opendkim \
    && chown -R opendkim:opendkim /var/db/dkim

ADD config/postfix/* /etc/postfix/
ADD config/supervisor/* /etc/supervisor.d/
ADD config/opendkim/* /etc/opendkim/

ADD scripts/* /usr/bin/

RUN chmod a+x /usr/bin/cert_gen.sh /usr/bin/dkim_hosts.sh /usr/bin/postfix.sh

CMD /usr/bin/cert_gen.sh && \
    /usr/bin/dkim_hosts.sh && \
    supervisord -n