ARG ALPINE_VERSION=3.16
FROM alpine:${ALPINE_VERSION}

# ---------------------------------------------------------------------
# Install https://github.com/krallin/tini - a very small 'init' process
# that helps processing signalls sent to the container properly.
# ---------------------------------------------------------------------
RUN set -eux && \
    apk add --update --no-cache tini

# --------------------------------------------------------------------------
# Install and configure sshd.
# --------------------------------------------------------------------------
RUN set -eux && \
    apk add --update --no-cache openssh && \
    ssh-keygen -A && \
    echo "PubkeyAcceptedKeyTypes +ssh-rsa" >> /etc/ssh/sshd_config

# ----------------------------------------
# Install GitLab CI required dependencies.
# ----------------------------------------
RUN set -eux && \
    apk --update --no-cache add \
    ca-certificates \
    bash \
    git \
    git-lfs && \
    git lfs install --skip-repo

# ----------------------------------------
# Set up entry point
# ----------------------------------------
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 22

ENTRYPOINT ["tini", "--", "/usr/local/bin/docker-entrypoint.sh"]
