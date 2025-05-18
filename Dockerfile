FROM postgres:16-alpine

RUN apk add --no-cache --virtual .build-deps \
      git build-base postgresql16-dev \
  && git clone --branch v0.7.0 https://github.com/pgvector/pgvector.git /pgvector \
  && cd /pgvector \
  && make && make install \
  && apk del .build-deps \
  && rm -rf /pgvector
