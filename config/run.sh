#!/bin/bash

set -e

# Update SQL connection string from environment
if [ -f /etc/dovecot/conf.d/auth-sql.conf.ext ]; then
  sed -i \
  -e "s|DB_HOST|${DB_HOST}|g" \
  -e "s|DB_USER|${DB_USER}|g" \
  -e "s|DB_PASSWORD|${DB_PASSWORD}|g" \
  -e "s|DB_DATABASE|${DB_DATABASE}|g" \
    /etc/dovecot/conf.d/auth-sql.conf.ext
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