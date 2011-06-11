# Connect the local repository to one you created on GitHub
git remote add origin git@github.com:weeksatimd/vimsettings.git

# Initial push to copy everything up to GitHub
git push -u origin master

# Copying the settings from GitHub to a new machine
git clone git@github.com:weeksatimd/vimsettings.git ~/.vim

# Create a submodule for a vim plugin inside .vim
git submodule add https://github.com/tpope/vim-surround.git bundle/surround

#
git submodule init
git submodule update
