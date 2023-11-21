FROM alpine:3.18

ENV TZ=Europe/Paris

RUN apk add --no-cache bash dovecot dovecot-fts-solr dovecot-mysql dovecot-pigeonhole-plugin 

COPY config/ /etc/dovecot/

RUN ["chmod", "+x", "/etc/dovecot/run.sh"]

CMD ["/etc/dovecot/run.sh"]

# IMAPS
EXPOSE 993
# LMTP
EXPOSE 10100
