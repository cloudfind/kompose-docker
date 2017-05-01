FROM alpine
MAINTAINER Rob Haswell <rob@cloudfindhq.com>

ENV KOMPOSE_VERSION=v0.6.0

RUN apk update && apk add --no-cache curl \
 && curl -L https://github.com/kubernetes-incubator/kompose/releases/download/${KOMPOSE_VERSION}/kompose-linux-amd64.tar.gz | tar zxO kompose-linux-amd64 > /usr/local/bin/kompose \
 && chmod +x /usr/local/bin/kompose \
 && adduser -S kompose \
 && apk del curl

USER kompose
CMD kompose
