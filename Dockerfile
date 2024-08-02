FROM postgres:16

RUN apt-get update && apt-get install -y \
    build-essential \
    postgresql-server-dev-all \
    git

RUN git clone https://github.com/mitchellh/pg-uuidv7.git /tmp/pg-uuidv7 && \
    cd /tmp/pg-uuidv7 && \
    make && \
    make install

RUN apt-get remove -y build-essential git && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /tmp/pg-uuidv7
