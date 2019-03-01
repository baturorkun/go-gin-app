FROM golang:1.11.2-stretch

RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh - \
    && apt-get -y update && apt-get -y install libc6 jq

WORKDIR /workspace

COPY entrypoint.sh /builder/entrypoint.sh

RUN chmod +x /builder/entrypoint.sh

ENTRYPOINT /builder/entrypoint.sh