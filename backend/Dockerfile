FROM python:3.10-alpine

WORKDIR /usr/src/backend
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

COPY requirements.txt .

## DJANGO CHANNELS
# apk add --virtual .build-deps gcc musl-dev libffi-dev
## SELENIUM
# apk add chromium chromium-chromedriver 

RUN pip install --upgrade pip \
    && pip install -r requirements.txt
    
ENTRYPOINT ["/usr/src/backend/entrypoint.sh"]