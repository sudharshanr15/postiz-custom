#!/bin/bash

set -x

mkdir -p /etc/supervisor.d/

if [[ "$INTERNAL_PROXY_ENABLED" != "false" ]]; then
    echo "Entrypoint: Starting internal proxy"
	cp -vf /app/supervisord_configs/caddy.conf /etc/supervisor.d/
fi

cp -vf /app/supervisord_configs/postiz.conf /etc/supervisor.d/

/usr/bin/supervisord -c /etc/supervisord.conf