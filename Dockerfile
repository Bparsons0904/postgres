FROM postgres:16.5-bookworm
RUN apt-get update && apt-get install -y \
  build-essential \
  curl \
  libpq-dev \
  postgresql-server-dev-16 \ 
  && cd "$(mktemp -d)" \
  && curl -LO "https://github.com/fboulnois/pg_uuidv7/archive/refs/tags/v1.5.0.tar.gz" \
  && tar xzf v1.5.0.tar.gz \
  && cd pg_uuidv7-1.5.0 \
  && make USE_PGXS=1 PG_CONFIG=/usr/lib/postgresql/16/bin/pg_config \ 
  && make USE_PGXS=1 PG_CONFIG=/usr/lib/postgresql/16/bin/pg_config install \
  && apt-get remove -y build-essential curl \
  && apt-get autoremove -y \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp/*
RUN mkdir -p /var/lib/postgresql/config/
COPY postgresql.conf /var/lib/postgresql/config/
COPY pg_hba.conf /var/lib/postgresql/config/
COPY init-extensions.sql /docker-entrypoint-initdb.d/
COPY init-db.sh /docker-entrypoint-initdb.d/
RUN chmod +x /docker-entrypoint-initdb.d/init-db.sh
