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
    1. `mkdir ~/.vim`
    2. `mkdir ~/.vim/after`
    3. `mkdir ~/.vim/after/ftplugin`
    4. `ln -sv ~/.dotfiles/markdown.vim ~/.vim/after/ftplugin`
4. indent
    1. `mkdir ~/.vim/after/indent`
    2. `ln -sv ~/.dotfiles/sass.vim ~/.vim/after/indent`

## nvim
1. `mkdir ~/.config/nvim`
2. `nvim .config/nvim/init.vim`
3. paste:
    ```
    set runtimepath+=~/.vim,~/.vim/after
    set packpath+=~/.vim
    source ~/.vimrc
    ```

## install packages
### vim
1. setup vim plug
    1. download plug.vim from https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    2. `mkdir ~/.vim/autoload`
    3. `mv ~/Downloads/plug.vim ~/.vim/autoload/`
2. intall vim packages
    1. `vim ~/.vimrc`
    2. `:PlugInstall`

### use package manager to install
3. fzf
4. ripgrep
5. tmux

### improve tmux
6. setup gitmux
    1. download from https://github.com/arl/gitmux/releases/
    2. extract
    3. `sudo mv gitmux /usr/local/bin`
7. git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    1. press tmux prefix + `I`

## enable italics in tmux
1. `tic -x tmux.terminfo`
