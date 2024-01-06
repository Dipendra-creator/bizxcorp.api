# Use an official Elixir image as the base image
FROM elixir:1.15.7-otp-25-alpine

# Create the wait-for-it.sh script
RUN echo '#!/bin/bash' > /usr/local/bin/wait-for-it.sh \
    && echo 'set -e' >> /usr/local/bin/wait-for-it.sh \
    && echo 'host="$1"' >> /usr/local/bin/wait-for-it.sh \
    && echo 'port="$2"' >> /usr/local/bin/wait-for-it.sh \
    && echo 'shift 2' >> /usr/local/bin/wait-for-it.sh \
    && echo 'cmd="$@"' >> /usr/local/bin/wait-for-it.sh \
    && echo 'until nc -z "$host" "$port"; do' >> /usr/local/bin/wait-for-it.sh \
    && echo '  >&2 echo "Waiting for $host:$port..."' >> /usr/local/bin/wait-for-it.sh \
    && echo '  sleep 1' >> /usr/local/bin/wait-for-it.sh \
    && echo 'done' >> /usr/local/bin/wait-for-it.sh \
    && echo '>&2 echo "$host:$port is available"' >> /usr/local/bin/wait-for-it.sh \
    && echo 'exec "$cmd"' >> /usr/local/bin/wait-for-it.sh \
    && chmod +x /usr/local/bin/wait-for-it.sh


# Set the working directory
WORKDIR /app

# Install Hex and Rebar
RUN mix local.hex --force \
    && mix local.rebar --force

# Copy only the mix files to take advantage of Docker layer caching
COPY mix.exs mix.lock ./

# Fetch the application dependencies
RUN mix deps.get

# Copy the entire application
COPY . .

# Expose the Phoenix port
EXPOSE 4000

# Set the environment to development
ENV MIX_ENV=dev

# Creation of the database
# RUN mix ecto.create

# Migration
# RUN mix ecto.migrate

# Set the release environment variable (useful for production builds)
# ENV MIX_ENV=prod

# Compile the application
RUN mix compile

# Entrypoint script


# Command to run the application
CMD ["mix", "ecto.migrate", "&&", "mix", "phx.server"]
