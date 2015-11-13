# docker-node
node, bower, grunt, gulp for dependency management

### usage

    getent passwd > $HOME/.mypasswd && \
    getent group > $HOME/.mygroup && \
    sudo docker run --rm -it -v $PWD:/app -u $USER -v $HOME/.mypasswd:/etc/passwd:ro -v $HOME/.mygroup:/etc/group:ro tsari/node npm "$@"

    This is a very hacky way to use this container. But with this you will work wih the correct user rights in the mounted volume.
