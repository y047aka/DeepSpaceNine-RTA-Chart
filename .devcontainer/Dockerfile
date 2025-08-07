# Multi-stage build for Elm + Gleam development environment

# Stage 1: Node.js environment with npm tools
FROM node:22-bookworm-slim AS node-stage
RUN npm install -g npm@latest

# Stage 2: Elm compiler and tools
FROM debian:bookworm-slim AS elm-stage
# https://github.com/elm/compiler/blob/master/installers/linux/README.md
RUN apt-get update && apt-get install -y curl \
    && curl -L -o elm.gz https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz \
    && gunzip elm.gz \
    && chmod +x elm \
    && mv elm /usr/local/bin/ \
    && rm -rf /var/lib/apt/lists/*

# Stage 3: Gleam compiler with Erlang/OTP runtime
FROM ghcr.io/gleam-lang/gleam:v1.11.1-erlang AS gleam-stage

# Stage 4: Final development environment
FROM mcr.microsoft.com/devcontainers/javascript-node:22

# Add Deno for additional JavaScript tooling
COPY --from=denoland/deno:bin-2.3.1 /deno /usr/local/bin/deno

# Copy compiled tools from previous stages
COPY --from=node-stage /usr/local/lib/node_modules/npm /usr/local/lib/node_modules/npm
COPY --from=elm-stage /usr/local/bin/elm /usr/local/bin/elm
COPY --from=gleam-stage /usr/local/lib/erlang /usr/local/lib/erlang
COPY --from=gleam-stage /usr/local/bin/erl /usr/local/bin/erl
COPY --from=gleam-stage /usr/local/bin/erlc /usr/local/bin/erlc
COPY --from=gleam-stage /usr/local/bin/escript /usr/local/bin/escript
COPY --from=gleam-stage /usr/local/bin/rebar3 /usr/local/bin/rebar3
COPY --from=gleam-stage /usr/bin/gleam /usr/local/bin/gleam

# User configuration
ARG USERNAME=node
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Install development tools and dependencies
RUN apt-get update && apt-get install -y \
    curl \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install npm packages globally
RUN npm install -g \
    npm@latest \
    nushell \
    @anthropic-ai/claude-code \
    elm-format@latest

# Setup user directories
RUN mkdir -p /home/$USERNAME/.elm \
    && mkdir -p /home/$USERNAME/.cache/gleam \
    && chown -R $USERNAME:$USERNAME /home/$USERNAME/.elm \
    && chown -R $USERNAME:$USERNAME /home/$USERNAME/.cache

# Update UID/GID if needed
RUN if [ "$USER_GID" != "1000" ] || [ "$USER_UID" != "1000" ]; then \
        groupmod --gid $USER_GID $USERNAME \
        && usermod --uid $USER_UID --gid $USER_GID $USERNAME \
        && chown -R $USER_UID:$USER_GID /home/$USERNAME; \
    fi

# Set working directory
WORKDIR /workspace
