# Instructions

1\. Clone 

```
cd ~/
git clone --recursive bitbucket.org/mondO/vim.git

```

2\. Run setup.sh; this will backup your current .vim and .vimrc to `old_vim`, and also create a symlink to `~/.vim/.vimrc`
```
./vim/setup.sh
```

3\. Rename cloned repository to ~/.vim
```
mv ~/cloned-vim-config ~/.vim
```

You may also need to update to vim8- color scheme doesn't work correctly in vim7 for some reason.

1\. Clone vim from the link [here](https://superuser.com/questions/162560/how-to-install-vim-on-linux-when-i-dont-have-root-permissions)

```
cd ~/
git clone https://github.com/vim/vim.git
```

2\. Configure vim to install to `~/.local` or a directory of your choice, then make and install

```
cd ~/vim
mkdir -p ~/.local
./configure --prefix=$HOME/.local && make && make install
```

3\. Make a simlink to ~/.local/bin/vim in ~/bin (creating `~/bin` if it doesn't already exist)
```
cd ~/
mkdir -p ~/bin
ln -sf ~/.local/bin/vim ~/bin/vim
```

4\. Finally, ensure that `~/bin/` is in your path by adding this to your `~/.bashrc` if it's not already there:

```
export PATH=$HOME/bin/:$PATH
```

Instructions for building/installing vim from source without sudo [here](https://superuser.com/questions/162560/how-to-install-vim-on-linux-when-i-dont-have-root-permissions)

official vim website [here](https://www.vim.org/git.php)

[how to use user-installed vim](https://stackoverflow.com/questions/17672259/how-to-use-local-user-installed-version-of-vim-linux/17672393)

Installing plugins: use git submodules as directed [here](https://gist.github.com/manasthakur/d4dc9a610884c60d944a4dd97f0b3560)

You may also want to add this to your bashrc to disable the ctrl+s shortcut that freezes the terminal:

```
stty -ixon
```
