# about
tracks my dotfiles
- .vimrc
- .bash_profile_user
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
3. `ln -sv ~/.dotfiles/markdown.vim ~/.vim/after/ftplugin`

## install packages
1. setup vim plug
    a. download plug.vim from https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    b. mv ~/Downloads/plu.vim ~/.vim/autoload
1. `brew install fzf`
2. `$(brew --prefix)/opt/fzf/install`
4. `brew install ripgrep`
5. setup gitmux
    a. download binary from https://github.com/arl/gitmux/releases/tag/v0.4.1
    b. `mv ~/Downloads/gitmux /usr/local/bin`

## enable italics in tmux
1. `tic -x tmux.terminfo`
