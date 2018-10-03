FROM alpine:3.8

LABEL MAINTAINER="aozk <rm.hyphen.rf.space.slash@gmail.com>"

RUN apk add --no-cache \
    ruby \
    graphviz \
    openjdk8-jre \
    && apk add --no-cache \
      --repository https://nl.alpinelinux.org/alpine/edge/community \
      font-bakoma-ttf \
    && apk add --no-cache \
      --repository https://nl.alpinelinux.org/alpine/edge/testing \
      font-ipa \
    && apk add --no-cache --virtual .makedepends \
        build-base \
        ruby-dev \
    && gem install --no-document \
        asciidoctor \
        asciidoctor-diagram \
        coderay \
        json \
    && gem install --no-document asciidoctor-pdf --pre \
    && gem install --no-document asciidoctor-pdf-cjk \
    && apk del -r --no-cache .makedepends

WORKDIR /doc
VOLUME /doc

ENTRYPOINT ["asciidoctor", "-r", "asciidoctor-diagram"]
