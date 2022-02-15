FROM python:3.10-alpine as base
FROM base as builder

WORKDIR /usr/src/backend
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

COPY . .

## DJANGO CHANNELS
# apk add --virtual .build-deps gcc musl-dev libffi-dev
## SELENIUM
# apk add chromium chromium-chromedriver 

RUN pip install --upgrade pip \
    && pip install -r requirements.txt \
    && sed -i 's/\r$//g' /usr/src/backend/entrypoint.sh \
    && chmod +x /usr/src/backend/entrypoint.sh
    
ENTRYPOINT ["/usr/src/backend/entrypoint.sh"]