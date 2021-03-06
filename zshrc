# zshrc
# "%{${fg[default]}%}
# JRW 06/12/11
#
# Setting to allow use of colors in prompt
autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
    colors
fi

# Load prompt and completion functions
autoload -U promptinit; promptinit
autoload -U compinit; compinit

# Set prompt
PROMPT="%{${fg[magenta]}%}%~
%# "%{${fg[default]}%}
RPROMPT="%{${fg[magenta]}%}[%w, %T]"%{${fg[default]}%}

# Set the window title to: username@hostname: directory
case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;%n@%m: %~\a"}
        ;;
esac

# Default editor
VISUAL="vi"
EDITOR="vi"
bindkey -v

# History Settings
# Show the command before executing it using !!, etc.
setopt HIST_VERIFY
# Save the history between sessions
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zhistory
# Add to history file as we go along instead of waiting until shell exits
setopt INC_APPEND_HISTORY
# Include history items from other windows
setopt SHARE_HISTORY
# Include timestamps with history
setopt EXTENDED_HISTORY
# If the current line duplicates an older one, delete the older one
setopt HIST_IGNORE_ALL_DUPS
# If you prefix a command line with a space, it won't go into .zhistory
setopt HIST_IGNORE_SPACE
# Don't store calls to history in the history
setopt HIST_NO_STORE
# Don't list functions in the history
setopt HIST_NO_FUNCTIONS

setopt NO_BEEP

# If you leave off the cd but name a directory, the cd is assumed ("..")
setopt AUTO_CD

# Allow zsh powerful pattern matching
setopt EXTENDED_GLOB

# Allow zsh tee functionality
setopt MULTIOS

# Try to autocorrecct the command
setopt CORRECT
# and the filename arguments (prefix a command nocommand to avoid this
setopt CORRECT_ALL

# If the alias file exists, read it in
if [[ -r ~/bin/zalias ]]; then
    . ~/bin/zalias
fi

# Colorize directory listings
LSCOLORS='GxcxcxdxbxegedabagdxBx'
export LSCOLORS

# Shell keybindings
bindkey '^p' history-beginning-search-backward
bindkey '^n' history-beginning-search-forward

# Control-Q to temporary erase the current line and then put it back for you
bindkey '^q' push-line-or-edit
bindkey '\eq' backward-kill-line

# Named directories
teaching=/Users/weeks/Dropbox/Current/Teaching
current=/Users/weeks/Dropbox/Current
java=/Users/weeks/Dropbox/Software\ Projects/Java
