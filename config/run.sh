#!/bin/bash

# Personnalisation de la configuration
sed -i "s/#connect =/connect = host=${DB_HOST} dbname=${DB_DATABASE} user=${DB_USER} password=${DB_PASSWORD}/g" /etc/dovecot/dovecot-sql.conf.ext

#Start services

exec /usr/sbin/dovecot -F