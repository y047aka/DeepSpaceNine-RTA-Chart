ARG CLAUDE_CODE_VERSION=latest

# Stage 1: Gleam compiler with Erlang/OTP runtime
FROM ghcr.io/gleam-lang/gleam:v1.12.0-erlang AS gleam-stage

# Stage 2: nushell
FROM ghcr.io/nushell/nushell:latest-bookworm AS nushell-stage

# Stage 3: Base tools installation using official Playwright image
FROM mcr.microsoft.com/playwright:v1.54.0-noble AS base-tools

RUN adduser node

RUN npm install -g npm@latest

# Install basic development tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    less \
    git \
    procps \
    sudo \
    fzf \
    zsh \
    man-db \
    unzip \
    gnupg2 \
    gh \
    iptables \
    ipset \
    iproute2 \
    dnsutils \
    aggregate \
    jq \
    nano \
    vim \
    wget \
    ca-certificates \
    lsb-release \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PostgreSQL 17 repository and client tools
RUN wget -qO- https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor -o /usr/share/keyrings/postgresql-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/postgresql-keyring.gpg] https://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
    && apt-get update && apt-get install -y --no-install-recommends \
    postgresql-client-17 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*


# Stage 4: Development environment without Claude CLI
FROM base-tools AS without-claude

# Copy compiled tools from previous stages
COPY --from=gleam-stage /usr/local/lib/erlang /usr/local/lib/erlang
COPY --from=gleam-stage /usr/local/bin/erl /usr/local/bin/erl
COPY --from=gleam-stage /usr/local/bin/erlc /usr/local/bin/erlc
COPY --from=gleam-stage /usr/local/bin/escript /usr/local/bin/escript
COPY --from=gleam-stage /usr/local/bin/rebar3 /usr/local/bin/rebar3
COPY --from=gleam-stage /usr/bin/gleam /usr/local/bin/gleam
COPY --from=nushell-stage /usr/bin/nu /usr/local/bin/nu

ARG USERNAME=node

# Setup user directories
RUN mkdir -p /home/$USERNAME/.cache/gleam \
    && chown -R $USERNAME:$USERNAME /home/$USERNAME/.cache

# Create workspace and config directories and set permissions
RUN mkdir -p /workspace /home/node/.claude && \
  chown -R node:node /workspace /home/node/.claude

WORKDIR /workspace

# Set the default shell to zsh rather than sh
ENV SHELL=/bin/zsh


# Stage 5: Final development environment with Claude CLI
FROM without-claude

# Install Claude
RUN npm install -g @anthropic-ai/claude-code@${CLAUDE_CODE_VERSION}

# Copy and set up firewall script
# https://github.com/anthropics/claude-code/blob/main/.devcontainer/Dockerfile
COPY init-firewall.sh /usr/local/bin/
USER root
RUN chmod +x /usr/local/bin/init-firewall.sh && \
  echo "node ALL=(root) NOPASSWD: /usr/local/bin/init-firewall.sh" > /etc/sudoers.d/node-firewall && \
  chmod 0440 /etc/sudoers.d/node-firewall
USER node
