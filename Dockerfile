FROM postgres:latest

RUN apt-get update && apt-get install -y \
    build-essential \
    postgresql-server-dev-all \
    git \
    openssh-client

RUN mkdir -p /root/.ssh && chmod 0700 /root/.ssh

RUN ssh-keyscan -H github.com >> /root/.ssh/known_hosts

ENV DOCKER_BUILDKIT=1

RUN --mount=type=ssh git clone git@github.com:mitchellh/pg-uuidv7.git /tmp/pg-uuidv7 && \
    cd /tmp/pg-uuidv7 && \
    make && \
    make install

RUN apt-get remove -y build-essential git && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /tmp/pg-uuidv7
