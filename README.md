vimrc
=====

StevenTing's vimrc


Quick start
-----------

```
git clone https://github.com/steventing/vimrc.git ~/vimrc
ln -s ~/vimrc/.vimrc ~/.vimrc
ln -s ~/vimrc/.vim ~/.vim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall! +qall

remove the unecessary key-map bundle in gtags-scope.vim,
it conflicts with the CtrlP plugin
```

NOTE
----------

if you want to enable the gtags, please download the latest version here
https://www.gnu.org/software/global/
e.g.
```
wget http://tamacom.com/global/global-6.6.3.tar.gz

untar global-6.6.3.tar.gz
cd global-6.6.3
./configure && make -j8 && make install

it depends the ncurses: apt install libncurses5-dev
```

Enable the gtags to parse the other PL like python, javascript
```
pip install pygments

export GTAGSCONF=/usr/local/share/gtags/gtags.conf
export GTAGSLABEL=pygments
```


