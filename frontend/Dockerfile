
FROM node:17-alpine as builder
WORKDIR /usr/build

COPY package.json .
COPY yarn.lock .
RUN yarn install

FROM node:17-alpine
WORKDIR /usr/src/frontend

# add/append node_module[vite] path to environment path
ENV PATH=$PATH:/usr/src/frontend/node_modules
ENV NODE_PATH=/usr/src/frontend/node_modules
COPY --from=builder /usr/build /usr/src/frontend