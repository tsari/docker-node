FROM node:4.2.6
MAINTAINER Tibor Sári <tiborsari@gmx.de>

RUN useradd -ms /bin/bash node
RUN chown -R node.node /home/node && chmod -R 777 /home/node

#USER node
ENV HOME /home/node

# Set up the application directory
VOLUME ["/app"]
WORKDIR /app

CMD [ "node", "-v" ]