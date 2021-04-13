# about
tracks my dotfiles:
- .vimrc
- .bash_profile_user
- .tmux.conf
- markdown.vim

# instructions

## bash

### Mac
1. add `source ~/.dotfiles/.bash_profile_user` into your .bash_profile

### Linux
1. add `source ~/.dotfiles/.bash_profile_user` into your .bashrc
2. add `source ~/.dotfiles/.bash_profile_user_linux` into your .bashrc

1. add 2 lines below into your .gitconfig
    `[core]
        excludesfile = ~/.dotfiles/.gitignore_global`

## create symlinks
1. `ln -sv ~/.dotfiles/.vimrc ~`
2. `ln -sv ~/.dotfiles/.tmux.conf ~`
3. markdown
    a. `mkdir ~/.vim`
    b. `mkdir ~/.vim/after`
    c. `ln -sv ~/.dotfiles/markdown.vim ~/.vim/after/ftplugin`

## install packages
### vim
1. setup vim plug
    a. download plug.vim from https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    b. `mkdir ~/.vim/autoload`
    b. `mv ~/Downloads/plug.vim ~/.vim/autoload/`
2. intall vim packages
    a. `vim ~/.vimrc`
    b. `:PlugInstall`

### use package manager to install
3. fzf
4. ripgrep
5. tmux

### improve tmux
6. setup gitmux
    a. download from https://github.com/arl/gitmux/releases/
    b. extract
    b. `sudo mv gitmux /usr/local/bin`
7. git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

## enable italics in tmux
1. `tic -x tmux.terminfo`

## nvim
1. `mkdir ~/.config/nvim`
2. `nvim .config/nvim/init.vim`
3. paste:
    set runtimepath+=~/.vim,~/.vim/after
    set packpath+=~/.vim
    source ~/.vimrc
