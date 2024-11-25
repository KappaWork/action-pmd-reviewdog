FROM openjdk:17-alpine

ENV REVIEWDOG_VERSION=v0.14.1

RUN apk update && apk add wget

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}

RUN wget -q https://github.com/pmd/pmd/releases/download/pmd_releases%2F6.55.0/pmd-bin-6.55.0.zip \
 && unzip pmd-bin-6.55.0.zip

RUN apk add --no-cache git

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
