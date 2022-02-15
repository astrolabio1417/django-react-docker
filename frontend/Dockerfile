
FROM node:17-alpine as builder

WORKDIR /usr/build/frontend
COPY ["package.json", "yarn.lock"] .

RUN yarn install --frozen-lockfile

FROM node:17-alpine

WORKDIR /usr/src/frontend
COPY --from=builder /usr/build/frontend .
COPY . .

RUN sed -i 's/\r$//g' /usr/src/frontend/entrypoint.sh
RUN chmod +x /usr/src/frontend/entrypoint.sh
ENTRYPOINT ["/usr/src/frontend/entrypoint.sh"]