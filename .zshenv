# .zshenv - Zsh environment configuration file
#
# This file sets up the core environment variables and executes profile scripts
# for the Zsh shell. It runs for all Zsh sessions (login, non-login, interactive,
# and non-interactive).
#
# Environment Variables:
#   ZSH       - Path to the oh-my-zsh framework installation directory
#   ZSH_HOME  - Path to custom zsh configuration scripts directory
#
# Profile Script Loading:
#   Automatically sources all scripts in $ZSH_HOME/profile.d/ directory
#   to set up PATH and other environment configurations in a modular way.
#   Scripts are executed in shell glob order.
#
# Usage:
#   This file is automatically loaded by Zsh. Place additional profile
#   scripts in ~/.zsh/profile.d/ to extend the environment setup.

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
