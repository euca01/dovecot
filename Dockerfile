 F0ROM alpine:3.18

ENV TZ=Europe/Paris

RUN apk add --no-cache bash dovecot dovecot-fts-solr dovecot-mysql dovecot-pigeonhole-plugin tzdata && \ 
       ln -s /usr/share/zoneinfo/$TZ /etc/localtime && \
       dduser -u 1000 -h /var/mail -D vmail vmail && \
       chown vmail:vmail /var/mail 

COPY config/ /etc/dovecot/

VOLUME ["/etc/ssl/dovecot", "/var/mail"]

RUN ["chmod", "+x", "/etc/dovecot/run.sh"]

CMD ["/etc/dovecot/run.sh"]

# IMAPS
EXPOSE 993
# LMTP
EXPOSE 10100
