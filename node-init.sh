#!/usr/bin/env bash
# create local npm-global dir (https://docs.npmjs.com/getting-started/fixing-npm-permissions)
mkdir -p ~/.npm-global

# add binary path to PATH on host system
files=(.profile .bashrc .xsessionrc)
for file in ${files[@]}
do
        grep -e "# include user npm-global directory" "$HOME/$file" &> /dev/null
        if [ $? != 0 ]; then
            echo "[*] including user npm-global directory into $HOME/$file";
            {
                echo ''; \
                echo '# include user npm-global directory'; \
                echo 'if [ -d "$HOME/.npm-global/bin" ] ; then'; \
                echo '    PATH="$HOME/.npm-global/bin:$PATH"'; \
                echo 'fi'; \
                echo ''; \
            } | tee -a "$HOME/$file" &> /dev/null
        fi;
done
