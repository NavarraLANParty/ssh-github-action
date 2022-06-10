FROM docker.io/library/alpine:3.16.0

# hadolint ignore=DL3018
RUN apk add --no-cache bash openssh

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
