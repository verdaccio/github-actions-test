FROM alpine:latest

LABEL "com.github.actions.name"="git checkout fork"
LABEL "com.github.actions.description"="Checks out code from pull request"
LABEL "com.github.actions.icon"="git-pull-request"
LABEL "com.github.actions.color"="white"
LABEL "repository"="http://github.com/gr2m/git-checkout-fork-action"
LABEL "maintainer"="Gregor Martynus (https://github.com/gr2m)"

RUN	apk add --no-cache \
    git \
    jq

COPY pr.sh /usr/bin/pr.sh

RUN chmod +x /usr/bin/pr.sh

ENTRYPOINT ["pr.sh"]