# about
tracks my dotfiles
- .vimrc
- .bash_profile_user
- markdown.vim

# instructions
1. add `source ~/.bash_profile_user` into your .bash_profile
2. create symlinks
    1. `ln -sv ~/.dotfiles/.bash_profile_user ~`
    2. `ln -sv ~/.dotfiles/.vimrc ~`
    3. `ln -sv ~/.dotfiles/.tmux.conf ~`
    4. `ln -sv ~/.dotfiles/markdown.vim ~/.vim/after/ftplugin`
3. install packages
    1. `brew install fzf`
    2. `$(brew --prefix)/opt/fzf/install`
    4. `brew install ripgrep`
    5. setup gitmux
        a. download binary from https://github.com/arl/gitmux/releases/tag/v0.4.1
        b. `mv ~/Downloads/gitmux /usr/local/bin`
4. enable italics in tmux
    1. `tic -x tmux.iterm.info`
