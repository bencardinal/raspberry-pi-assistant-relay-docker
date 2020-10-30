FROM node:lts-alpine

ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache --virtual .gyp \
  python3 \
  make \
  g++ \
  && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

RUN mkdir -p /assistant_relay/bin \
  && touch /assistant_relay/bin/config.json \
  && npm i pm2 -g

WORKDIR /assistant_relay

RUN wget https://github.com/greghesp/assistant-relay/releases/download/v3.2.0/release.zip \
  && unzip release.zip \
  && rm release.zip \
  && npm i

CMD ["npm", "run", "start"]
