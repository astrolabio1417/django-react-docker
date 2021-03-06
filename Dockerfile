FROM node:17-alpine as frontbuilder
WORKDIR /build

COPY frontend/package.json frontend/yarn.lock /build/
RUN yarn install --frozen-lockfile --no-cache
COPY frontend .
RUN yarn run build


FROM python:3.10-alpine as backend

WORKDIR /usr/src/backend
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1
COPY ./backend .

RUN apk update \
    # NGINX FOR REVERSE PROXY. SUPERVISOR FOR APPS. BASH FOR HEROKU BASH. RUBY FOR ERB CONVERTER
    && apk add --no-cache nginx supervisor bash ruby \
    && pip install --upgrade pip \
    && pip install -r requirements.txt \
    && mkdir -p /etc/supervisor/conf.d \
    && mkdir -p /usr/src/backend/staticfiles \
    && rm /etc/nginx/nginx.conf

COPY ./supervisord.conf /etc/supervisord.conf
COPY --from=frontbuilder /build/dist /usr/src/backend/staticfiles
COPY ./nginx/nginx.conf.erb /etc/nginx/nginx.conf.erb

# ENV BACKEND_SECRET_KEY=myrandomkey
# ENV BACKEND_DEBUG=0

# ENV BACKEND_ALLOWED_HOSTS=localhost

# ENV BACKEND_CORS_ORIGINS="http://localhost https://localhost"
# ENV BACKEND_CSRF_TRUSTED_ORIGIN="http://localhost https://localhost"

# ENV DATABASE_ENGINE=django.db.backends.sqlite3
# ENV POSTGRES_USER=username
# ENV POSTGRES_PASSWORD=password
# ENV POSTGRES_DB=mydatabase
# ENV POSTGRES_PORT=5432
# ENV POSTGRES_HOST=postgres
# ENV PORT=80
# EXPOSE 80

# ENV DJANGO_SETTINGS_MODULE=backend.settings.prod 

RUN chmod +x /usr/src/backend/entrypoint.prod.sh

ENTRYPOINT ["/usr/src/backend/entrypoint.prod.sh"]
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
