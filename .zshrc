# Uncomment if you want to profile startup time
# zmodload zsh/zprof
#
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=14

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$ZSH_HOME/custom

# Mac fixy fixy Big Sur
DISABLE_COMPFIX=true

# I'm disabling magic function since they're eating
# too much time during shell startup
DISABLE_MAGIC_FUNCTIONS=true

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=( \
    vi-mode \
    dotools \
    hist \
    themes \
    fzf \
    )

# User configuration

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Export the fpath so all custom function can be autoloadable
fpath=($ZSH_HOME/lib $fpath) && export FPATH

# You may need to manually set your language environment
# export LANG=en_US.UTF-8


######################################
# Start tmux on every shell login
# source: https://wiki.archlinux.org/index.php/Tmux#Start_tmux_in_urxvt
######################################

#
# If not running interactively, do not do anything
#
[[ $- != *i* ]] && return

#
# checks tmux is installed before trying to launch it.
# NOTE: it won't run if invoked under vscode or neovim
if [[ "$TERM_PROGRAM" != "vscode" && -z "$NVIM" ]]; then
    if which tmux >/dev/null 2>&1; then
        # Attach to existing deattached session or start a new session
        if [[ -z "$TMUX" ]] ;then
            ID="`tmux ls | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
            if [[ -z "$ID" ]] ;then # if not available create a new one
                tmux new-session
            else
                tmux attach-session -t "$ID" # if available attach to it
            fi
        fi
    fi
fi

# Uncomment if you want to profile startup time
# zprof
