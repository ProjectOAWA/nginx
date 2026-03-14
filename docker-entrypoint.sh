#!/bin/sh
set -e

# Substitute ${DOMAIN} in nginx conf files, leaving other nginx variables intact
for f in /etc/nginx/conf.d/*.conf; do
    envsubst '${DOMAIN}' < "$f" > "${f}.tmp" && mv "${f}.tmp" "$f"
done

exec "$@"
