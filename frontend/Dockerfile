
FROM node:17-alpine as builder

WORKDIR /usr/build/frontend
COPY ["package.json", "yarn.lock"] .

RUN yarn install --frozen-lockfile

FROM node:17-alpine

WORKDIR /usr/src/frontend
COPY --from=builder /usr/build/frontend .
COPY . .

ENTRYPOINT ["/usr/src/frontend/entrypoint.sh"]