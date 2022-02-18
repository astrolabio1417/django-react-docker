
FROM node:17-alpine

WORKDIR /usr/src/frontend

# add/append node_module[vite] path to environment path
ENV PATH=$PATH:/usr/src/frontend/node_modules

COPY package.json .
COPY yarn.lock .
RUN yarn install