# 
# .zshrc
# 
# by Max Zangs
# 

# OpenJDK
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# Colors.
unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1

# Nicer looking prompt
export PS1=$'\n'"%F{cyan} %*%F{grey} %3~ %F{white}"$'\n'"$ "

# Bash-style time output.
export TIMEFMT=$'\nreal\t%*E\nuser\t%*U\nsys\t%*S'

# Include alias file (if present) containing aliases for ssh, etc.
if [ -f ~/.aliases ]
then
  source ~/.aliases
fi
