# Tell zsh that path should not allow duplicate entries
typeset -U path

# Add my bin to command path
path=(~/bin /usr/local/bin $path)

# Add my bin to function path
[[ $fpath = *weeks* ]] || fpath=(~weeks/bin $fpath)
# Autoload my functions
autoload -U ${fpath[1]}/*(:t)

JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0/Home/
