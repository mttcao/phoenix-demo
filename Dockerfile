FROM msaraiva/elixir-dev:1.3.4

# Add Erlang dependencies
RUN apk add --update nodejs erlang-tools openssh-client && rm -rf /var/cache/apk/*
RUN mix local.rebar --force

# Copy SSH key into container for private dependencies
# RUN mkdir -p /root/.ssh
# COPY id_rsa /root/.ssh
#RUN chmod 600 /root/.ssh/id_rsa \
#  && ssh-keyscan github.com >> /root/.ssh/known_hosts

# Cache dependencies
COPY ["mix.exs", "mix.lock", "/tmp/cache/"]
WORKDIR /tmp/cache
RUN mix local.hex --force && mix deps.get --only prod && rm -rf /tmp/cache

# Copy code
COPY . /root/app/
WORKDIR /root/app

# Run release task
#RUN mix ecto.create
#CMD mix ecto.create && mix phoenix.server
CMD mix phoenix.server
