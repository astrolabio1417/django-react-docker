#!/bin/sh

echo "GENERATE NGINX.CONF"
erb /etc/nginx/nginx.conf.erb > /etc/nginx/nginx.conf

sh /usr/src/backend/entrypoint.prod.sh

echo "RUN NGINX"
nginx -g "daemon off;"