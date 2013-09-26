#!/bin/sh
# installs vim addons I like
# http://www.bestofvim.com/

cd ~/.vim/bundle
git clone https://github.com/plasticboy/vim-markdown.git #vim-markdown
git clone https://github.com/mikewest/vimroom.git        #writing prose
git clone git://github.com/tpope/vim-surround.git
git clone https://github.com/bigfish/vim-js-beautify.git #use js-beautify from Vim
git clone https://github.com/godlygeek/csapprox.git      #make gvim-only coloschemes work in terminal

echo "vim addons installed!"
exit
