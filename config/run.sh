#!/bin/bash

set -e

# Update SQL connection string from environment
if [ -f /etc/dovecot/dovecot-sql.conf.ext ]; then
  sed -i "s|#connect =.*|connect = host=${DB_HOST} dbname=${DB_DATABASE} user=${DB_USER} password=${DB_PASSWORD}|" \
    /etc/dovecot/dovecot-sql.conf.ext
fi

# Generate dh.pem if missing
if [ ! -f "/etc/ssl/dovecot/dh.pem" ]; then
  echo "Generating dh.pem..."
  openssl dhparam -out /etc/ssl/dovecot/dh.pem 2048
fi

# Compile Sieve scripts if needed
if [ -d "/etc/dovecot/sieve" ]; then
  for file in /etc/dovecot/sieve/*.sieve; do
    [ -f "$file" ] && sievec "$file"
  done
fi

# Launch dovecot in foreground
exec dovecot -F