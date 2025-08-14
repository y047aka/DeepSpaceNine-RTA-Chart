ARG CLAUDE_CODE_VERSION=latest

# Stage 1: Gleam compiler with Erlang/OTP runtime
FROM ghcr.io/gleam-lang/gleam:v1.12.0-erlang AS gleam-stage

# Stage 2: nushell
FROM ghcr.io/nushell/nushell:latest-bookworm AS nushell-stage

# Stage 3: Base tools installation
FROM node:22-bookworm AS base-tools
RUN npm install -g npm@latest

# Install basic development tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    zsh \
    && rm -rf /var/lib/apt/lists/*


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

# Set up non-root user
ARG USERNAME=node

# Setup user directories
RUN mkdir -p /home/$USERNAME/.cache/gleam \
    && chown -R $USERNAME:$USERNAME /home/$USERNAME/.cache

WORKDIR /workspace

# Set the default shell to zsh rather than sh
ENV SHELL=/bin/zsh


# Stage 5: Final development environment with Claude CLI
FROM without-claude

# Install Claude
RUN npm install -g @anthropic-ai/claude-code@${CLAUDE_CODE_VERSION}
