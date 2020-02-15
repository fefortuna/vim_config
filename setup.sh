#!/bin/bash
# set up vim after cloning bitbucket.org/mondO/vim.git

# get the dirname the script (which should be the root of the cloned repo)

DIR="$(dirname $0)"

# first backup old vim settings
cd $HOME
mkdir -p old_vim
if [ -f ~/.vim ]; then
  mv ~/.vim ~/old_vim/
fi
if [ -f ~/.vimrc ]; then
  mv ~/.vimrc ~/old_vim/
fi

ln -sf ~/.vim/.vimrc ~/.vimrc

echo "Old .vim and .vimrc saved in ~/old_vim, please execute 'mv $DIR ~/.vim'"
