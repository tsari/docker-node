FROM node:4.1.1
MAINTAINER Tibor Sári <tiborsari@gmx.de>

RUN useradd -ms /bin/bash node
RUN chown -R node.node /home/node & chmod -R 777 /home/node

USER node
ENV HOME /home/node

# Set up the application directory
VOLUME ["/app"]
WORKDIR /app

ENV USER_NAME tempuser
ENV GROUP_NAME tempgroup

CMD groupadd -g $(stat -c "%g" /app) $GROUP_NAME && \
    useradd -ms /bin/bash -u $(stat -c "%u" /app) -g $(stat -c "%g" /app) $USER_NAME && \
    usermod -a -G $GROUP_NAME $USER_NAME && \
    export HOME=/home/$USER_NAME && \
    su $USER_NAME

ENTRYPOINT ["node"]