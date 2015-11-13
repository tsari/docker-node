FROM node:4.1.1
MAINTAINER Tibor Sári <tiborsari@gmx.de>

RUN npm install -g bower
RUN npm install -g grunt-cli
RUN npm install -g gulp

RUN useradd -ms /bin/bash node
RUN chown -R node.node /home/node && chmod -R 777 /home/node

#USER node
ENV HOME /home/node

# Set up the application directory
VOLUME ["/app"]
WORKDIR /app

CMD [ "npm", "version" ]