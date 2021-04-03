FROM node:15-slim

LABEL maintainer="jean_christophe_morin@hotmail.com"

ARG HUGO_VERSION=0.82.0
ARG SASS_VERSION=1.0.0-beta.7

LABEL hugo=${HUGO_VERSION}

RUN mkdir -p /opt/hugo && \
    cd /opt/hugo && \
    apt-get update && \
    apt-get install -y wget && \
    wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    tar xvfz hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    rm hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    cd /opt && \
    wget https://github.com/sass/dart-sass-embedded/releases/download/${SASS_VERSION}/sass_embedded-${SASS_VERSION}-linux-x64.tar.gz && \
    tar xvfz sass_embedded-${SASS_VERSION}-linux-x64.tar.gz && \
    rm sass_embedded-${SASS_VERSION}-linux-x64.tar.gz

ENV PATH=/opt/hugo:/opt/sass_embedded:$PATH
