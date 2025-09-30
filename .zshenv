# Path to oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Path to zsh scripts
export ZSH_HOME=$HOME/.zsh

# These are used by dot-env
export DOT_ENV_OUT=${HOME}/.dotenv.out
export DOT_ENV_CFG=${HOME}/.dotenv

# PATH is set through a set of scripts
if [ -d $ZSH_HOME ]; then
    for i in $ZSH_HOME/profile.d/*; do
        . $i
    done
    unset i
fi
