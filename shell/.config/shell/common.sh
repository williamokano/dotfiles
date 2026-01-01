# PATH

if [ -d "$HOME/.local/bin" ] && [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# Editors
export EDITOR="nvim"
export VISUAL="nvim"
export GIT_EDITOR="nvim"

