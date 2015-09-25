#!/bin/sh
# installs vim plugins
# http://www.bestofvim.com/

# plugins
mkdir -p ~/.vim/bundle
cd ~/.vim/bundle
git clone https://github.com/plasticboy/vim-markdown.git #vim-markdown
git clone https://github.com/mikewest/vimroom.git        #writing prose
git clone https://github.com/tpope/vim-surround.git
git clone https://github.com/bigfish/vim-js-beautify.git #use js-beautify from Vim
git clone https://github.com/godlygeek/csapprox.git      #make gvim-only coloschemes work in terminal
echo "installed vim plugins."

# themes
mkdir -p ~/.vim/colors
cd ~/.vim/colors
cd ~/.vim/bundle
git clone https://github.com/chriskempson/base16-vim.git base16; cp base16/colors/*.vim . #base16
echo "installed vim colorschemes."

exit
