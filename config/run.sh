#!/bin/bash

# Personnalisation de la configuration
sed -i "s/#connect =/connect = host=${DB_HOST} dbname=${DB_DATABASE} user=${DB_USER} password=${DB_PASSWORD}/g" /etc/dovecot/dovecot-sql.conf.ext

if [ ! -f "/etc/ssl/dovecot/dh.pem" ]; then
   openssl dhparam -out /etc/ssl/dh.pem 2048
fi

# Compile Sieve files if doesn't exist
if [ ! -f "/etc/dovecot/sieve/SpamToJunk.svbin" ]; then
   sievec /etc/dovecot/sieve/
fi



#Start services

exec /usr/sbin/dovecot -F
