
FROM node:10-alpine
WORKDIR /app
COPY . /app
RUN apk update \
    && apk add --update npm \
    && cd /app \
    && npm install
CMD ["npm", "start"]