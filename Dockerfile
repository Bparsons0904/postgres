# Option 1: Remove the COPY for postgresql.conf from Dockerfile
FROM postgres:17.1-bookworm

RUN apt-get update && apt-get install -y \
  build-essential \
  curl \
  libpq-dev \
  postgresql-server-dev-all \
  && cd "$(mktemp -d)" \
  && curl -LO "https://github.com/fboulnois/pg_uuidv7/archive/refs/tags/v1.5.0.tar.gz" \
  && tar xzf v1.5.0.tar.gz \
  && cd pg_uuidv7-1.5.0 \
  && make \
  && make install \
  && apt-get remove -y build-essential curl \
  && apt-get autoremove -y \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp/*

COPY init-extensions.sql /docker-entrypoint-initdb.d/
COPY init-db.sh /docker-entrypoint-initdb.d/
RUN chmod +x /docker-entrypoint-initdb.d/init-db.sh
