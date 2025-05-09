ARG ELIXIR_VERSION=1.18.3
ARG OTP_VERSION=27.3.3
ARG DEBIAN_VERSION=bullseye-20250428-slim

ARG BUILDER_IMAGE="hexpm/elixir:${ELIXIR_VERSION}-erlang-${OTP_VERSION}-debian-${DEBIAN_VERSION}"
ARG RUNNER_IMAGE="oven/bun:1.2.12-slim"

# Setup the frontend build environment
FROM ${RUNNER_IMAGE} AS bun

WORKDIR /app/assets
COPY assets .
RUN bun install --production

# Setup the Elixir build environment
FROM ${BUILDER_IMAGE} AS builder

RUN apt-get update -y && apt-get install -y build-essential git \
    && apt-get clean && rm -f /var/lib/apt/lists/*_*

WORKDIR /app

# Setup Hex and Rebar package managers
RUN mix local.hex --force && \
    mix local.rebar --force

# Install project dependencies
ENV MIX_ENV=prod
COPY mix.exs mix.lock ./
RUN mix deps.get --only $MIX_ENV
RUN mkdir config

# Copy config files first to optimize caching
COPY config/config.exs config/${MIX_ENV}.exs config/
RUN mix deps.compile

# Copy application code
COPY priv priv
COPY lib lib
COPY assets assets
COPY --from=bun /app/assets ./assets

# Compile Elixir application
RUN mix assets.deploy
RUN mix compile

# Runtime config handled separately
COPY config/runtime.exs config/

# Build the release package
COPY rel rel
RUN mix release

# Setup the runtime environment
FROM ${RUNNER_IMAGE} AS runtime

# Install runtime dependencies
RUN apt-get update -y && \
    apt-get install -y libstdc++6 openssl libncurses5 locales ca-certificates \
    && apt-get clean && rm -f /var/lib/apt/lists/*_*

# Copy OpenSSL libs from builder for Erlang crypto compatibility
COPY --from=builder /usr/lib/*-linux-gnu/libcrypto.so* /usr/lib/
COPY --from=builder /usr/lib/*-linux-gnu/libssl.so* /usr/lib/

# Configure locale settings
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Prepare application directory
WORKDIR /app

# Set production environment
ENV MIX_ENV=prod
ENV NODE_ENV=production

# Copy only the compiled release
COPY --from=builder /app/_build/${MIX_ENV}/rel/polar ./

# Start the application
CMD ["/app/bin/server"]
