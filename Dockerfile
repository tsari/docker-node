FROM node:6.9.2
MAINTAINER Tibor Sári <tiborsari@gmx.de>

RUN \
    apt-get update -qq && \
    apt-get install --no-install-recommends -y \
        sudo \
    && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set up the application directory
VOLUME ["/app"]
WORKDIR /app

ADD https://raw.githubusercontent.com/tsari/docker-entrypoint/master/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set up the command arguments
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD [ "node", "-v" ]