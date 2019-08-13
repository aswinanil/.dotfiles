# about
tracks my dotfiles
- .vimrc
- .bash_profile_user
 
# instructions
1. add `source ~/.bash_profile_user` into your .bash_profile
2. create symlinks 
    1. `ln -sv ~/.dotfiles/.bash_profile_user ~`
    2. `ln -sv ~/.dotfiles/.vimrc ~`
3. to show iterm badge _(bash version)_
    1. `curl -L https://iterm2.com/shell_integration/bash \ -o ~/.iterm2_shell_integration.bash`
