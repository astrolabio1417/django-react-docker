#!/bin/sh

python manage.py migrate
python manage.py collectstatic --no-input

erb /etc/nginx/nginx.conf.erb > /etc/nginx/nginx.conf

exec "$@"