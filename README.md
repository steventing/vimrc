vimrc
=====

StevenTing's vimrc


Quick start
-----------

```
Switch to neovim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

touch .config/nvim/init.vim

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

git clone https://github.com/steventing/vimrc.git ~/vimrc
ln -s ~/vimrc/.vimrc ~/.vimrc
ln -s ~/vimrc/.vim ~/.vim

In vim execute :PlugInstall
```

NOTE
----------
nerd font download:
===
```
https://github.com/Karmenzind/monaco-nerd-fonts
```



