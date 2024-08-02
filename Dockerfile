FROM postgres:latest

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    libpq-dev \
    postgresql-server-dev-all

RUN cd "$(mktemp -d)" && \
    curl -LO "https://github.com/fboulnois/pg_uuidv7/archive/refs/tags/v1.5.0.tar.gz" && \
    tar xzf v1.5.0.tar.gz && \
    cd pg_uuidv7-1.5.0 && \
    make && \
    make install

RUN apt-get remove -y build-essential curl && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

COPY init-extensions.sql /docker-entrypoint-initdb.d/
