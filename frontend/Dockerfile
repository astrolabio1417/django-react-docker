FROM node:17-alpine

WORKDIR /usr/src/frontend
COPY . .

RUN yarn install

RUN sed -i 's/\r$//g' /usr/src/frontend/entrypoint.sh
RUN chmod +x /usr/src/frontend/entrypoint.sh
ENTRYPOINT ["/usr/src/frontend/entrypoint.sh"]
