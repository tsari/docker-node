#!/usr/bin/env bash
# create local npm-global dir (https://docs.npmjs.com/getting-started/fixing-npm-permissions)
mkdir -p ~/.npm-global

# add binary path to PATH on host system
{
    echo "Add the following into your .profile, .bashrc, .zshrc or .xsessionrc"; \
    echo ""; \
    echo '# include user npm-global directory'; \
    echo 'if [ -d "$HOME/.npm-global/bin" ] ; then'; \
    echo '    PATH="$HOME/.npm-global/bin:$PATH"'; \
    echo 'fi'; \
}