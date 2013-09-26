usage: `env GIT_SSL_NO_VERIFY=true` as a prefix to git bypasses lack of ca-cerficates.

    git clone https://github.com/octos/d.git
    cd ~/d; chmod +x dots.sh; ./dots.sh

push:

    git config --global user.name "github username"
    git config --global user.email "github email"
    git config --global credential.helper cache
