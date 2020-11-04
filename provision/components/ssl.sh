#!/bin/bash

if [ ! -f /var/www/provision/config/ssl/local.key ]; then
  openssl req -x509 \
    -newkey rsa:4096 \
    -sha256 \
    -days 730 \
    -nodes \
    -keyout /var/www/provision/config/ssl/local.key \
    -out /var/www/provision/config/ssl/local.crt \
    -subj "/CN=$1" \
    -addext "subjectAltName=DNS:$1,DNS:$2,DNS:$3,DNS:$4,DNS:$5,DNS:*.$1,DNS:*.$2,DNS:*.$3,DNS:*.$4,DNS:*.$5,IP:10.0.0.1"
fi