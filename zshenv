# Tell zsh that path should not allow duplicate entries
typeset -U path
# Add my current directory and my bin to path
path=(~/bin $path)
