FROM alpine:3.18

ENV TZ=Europe/Paris

RUN apk add --no-cache dovecot dovecot-fts-solr dovecot-mysql dovecot-pigeonhole-plugin 

CMD ["/usr/sbin/dovecot", "-F"]

EXPOSE 993
EXPOSE 24

