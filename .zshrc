# 
# .zshrc
# 
# @author Max Zangs
# 

# Colors.
unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1

# Nicer looking prompt
# export PS1=$'\n'"%F{14} %*%F{8} %~ %F{15}"$'\n'"%# "
PROMPT=$'\n'"%F{14} %*%F{8} %~ %F{15}"$'\n'"%# "

# Bash-style time output.
export TIMEFMT=$'\nreal\t%*E\nuser\t%*U\nsys\t%*S'

# Include alias file (if present) containing aliases for ssh, etc.
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

# Setting up homebrew
if [ -e /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Making pyenv available
# if command -v pyenv 1>/dev/null 2>&1; then
if [ -e /opt/homebrew/bin/pyenv ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    eval "$(pyenv init --path)"
fi

# Exporting OpenJDK if available
if [ -d /opt/homebrew/opt/openjdk/bin ]; then
    export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
fi
