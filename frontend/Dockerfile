
FROM node:17-alpine

WORKDIR /usr/src/frontend-dev
COPY . .
RUN yarn install

RUN sed -i 's/\r$//g' /usr/src/frontend-dev/entrypoint.sh
RUN chmod +x /usr/src/frontend-dev/entrypoint.sh
ENTRYPOINT ["/usr/src/frontend-dev/entrypoint.sh"]  