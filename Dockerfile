FROM alpine:3.6

RUN apk add --no-cache \
    tini \
    bash \
    git \
    perl \
    rsync \
    openssh-client \
    curl \
    docker \
    jq \
    su-exec \
    py-pip \
    libc6-compat \
    run-parts

ENV BUILDKITE_BUILD_PATH=/buildkite/builds \
    BUILDKITE_HOOKS_PATH=/buildkite/hooks \
    BUILDKITE_PLUGINS_PATH=/buildkite/plugins \
    PACKER_VERSION=1.1.3 \
    PACKER_SHA256SUM=b7982986992190ae50ab2feb310cb003a2ec9c5dcba19aa8b1ebb0d120e8686f

RUN pip install docker-compose

RUN curl -Lfs -o /usr/local/bin/buildkite-agent https://download.buildkite.com/agent/unstable/latest/buildkite-agent-linux-amd64 \
    && chmod +x /usr/local/bin/buildkite-agent \
    && mkdir -p /buildkite/builds /buildkite/hooks /buildkite/plugins \
    && curl -Lfs -o /usr/local/bin/ssh-env-config.sh https://raw.githubusercontent.com/buildkite/docker-ssh-env-config/master/ssh-env-config.sh \
    && chmod +x /usr/local/bin/ssh-env-config.sh

RUN curl https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip > packer_${PACKER_VERSION}_linux_amd64.zip \
    && unzip packer_${PACKER_VERSION}_linux_amd64.zip \
    && mv packer /bin/packer${PACKER_VERSION} \
    && rm -f packer_${PACKER_VERSION}_linux_amd64.zip

COPY ./entrypoint.sh /usr/local/bin/buildkite-agent-entrypoint

VOLUME /buildkite
ENTRYPOINT ["buildkite-agent-entrypoint"]
CMD ["start"]
