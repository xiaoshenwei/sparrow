if [[ -d $HOME/crystal-ci ]]; then
    echo PATH="$PATH:$HOME/crystal-ci/sbin"
fi
if [[ -d $HOME/lkp-tests ]]; then
    echo PATH="$PATH:$HOME/lkp-tests/sbin:$HOME/lkp-tests/bin:"
fi
