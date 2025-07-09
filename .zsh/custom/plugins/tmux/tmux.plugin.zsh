if which tmux >/dev/null 2>&1; then
    alias tmux="tmux -2 -u"
fi

# peek tool
# https://github.com/lf94/peek-for-tmux
peek() { tmux split-window -p 33 "$EDITOR" "$@" }
