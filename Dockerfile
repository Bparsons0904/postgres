FROM postgres:16

RUN apt-get update && apt-get install -y \
    build-essential \
    postgresql-server-dev-all \
    git \
    openssh-client

COPY ./id_rsa /root/.ssh/id_rsa
COPY ./id_rsa.pub /root/.ssh/id_rsa.pub
RUN chmod 600 /root/.ssh/id_rsa

RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

RUN git clone git@github.com:mitchellh/pg-uuidv7.git /tmp/pg-uuidv7 && \
    cd /tmp/pg-uuidv7 && \
    make && \
    make install

RUN apt-get remove -y build-essential git && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /tmp/pg-uuidv7
