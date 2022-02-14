# PULL PYTHON ALPHINE
FROM python:3.10-alpine as base
FROM base as builder

WORKDIR /
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

RUN pip install --upgrade pip

# install psycopg2 dependencies and fix libffi for djchannels.
# RUN apk update \
#     && apk add postgresql-dev gcc python3-dev musl-dev libffi libffi-dev

COPY requirements.txt .
RUN pip install -r requirements.txt

FROM base
WORKDIR /usr/src/backend

COPY --from=builder /usr/local /usr/local
# selenium chrome driver
# RUN apk --no-cache add chromium chromium-chromedriver 

# project
COPY . .

# endpoint
RUN sed -i 's/\r$//g' /usr/src/backend/entrypoint.sh
RUN chmod +x /usr/src/backend/entrypoint.sh
ENTRYPOINT ["/usr/src/backend/entrypoint.sh"]
