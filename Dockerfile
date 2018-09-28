FROM alpine:3.8

LABEL MAINTAINER="aozk <rm.hyphen.rf.space.slash@gmail.com>"

RUN apk add --no-cache \
    ruby \
    graphviz \
    && apk add --no-cache --virtual .makedepends \
        build-base \
        ruby-dev \
    && gem install --no-document \
        asciidoctor \
        asciidoctor-diagram \
        coderay \
        json \
    && apk del -r --no-cache .makedepends

WORKDIR /doc
VOLUME /doc

ENTRYPOINT ["asciidoctor", "-r", "asciidoctor-diagram"]
