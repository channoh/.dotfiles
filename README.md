# Personal Configuration
default configs for Ubuntu


## Installation

```
git clone https://github.com/channoh/.dotfiles.git
cd .dotfiles
./install.sh
```


## Vim Installation

1. Download and compile
    ```
    wget http://ftp.vim.org/pub/vim/unix/vim-8.1.tar.bz2
    tar -jxvf vim-8.1.tar.bz2
    cd vim81
    ./configure --with-features=huge \
                --enable-multibyte \
                --enable-rubyinterp \
                --enable-pythoninterp \
                --enable-perlinterp \
                --enable-luainterp \
                --enable-gui= gtk2 \
                --enable-cscope \
                --with-python-config-dir=/usr/lib/python2.7/config \
                --with-x \
                --prefix=/usr
    make VIMRUNTIMEDIR=/usr/share/vim/vim81
    sudo make install
    ```

2. Set vim as default editor
    ```
    sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
    sudo update-alternatives --set editor /usr/bin/vim
    sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
    sudo update-alternatives --set vi /usr/bin/vim
    ```

## Font
Download [Source Code Pro with Nerd Font](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete.ttf?raw=true) from [github.com/ryanoasis/nerd-fonts](https://github.com/ryanoasis/nerd-fonts).


## vim plugins

 1. VundleVim/Vundle.vim            - vundle manager
 2. pangloss/vim-javascript         - syntax and indentation for JavaScript
 3. derekwyatt/vim-scala            - syntax and indentation for Scala
 4. ekalinin/dockerfile.vim         - syntax and indentation for Dockerfile
 5. jiangmiao/auto-pairs            - insert or delete brackets, parens, quotes in pair
 6. Yggdroot/indentLine             - display thin vertical lines at each indentation level
 7. scrooloose/nerdtree             - file system explorer
 8. ryanoasis/vim-devicons
 9. tiagofumo/vim-nerdtree-syntax-highlight
10. majutsushi/tagbar               - browse the tags of the current file
11. triglav/vim-visual-increment    - increase and decrease number or letters sequence via visual mode
12. will133/vim-dirdiff             - show difference between two directories using vimdiff
13. bling/vim-airline               - status line
14. vim-airline/vim-airline-themes
15. godlygeek/tabular               - easily align text
16. plasticboy/vim-markdown         - for markdown
17. scrooloose/nerdcommenter        - Comment functions
18. haya14busa/incsearch.vim        - incrementally highlights ALL pattern matches
19. mhinz/vim-startify              - Fency start screen
20. vim-scripts/SyntaxRange         - Syntax range (for Gem5)


## Useful packages

 1. cgdb-0.7.0 (https://cgdb.me/files/cgdb-0.7.0.tar.gz)
 2. parallel-20190322
 3. tmux-2.8 (https://github.com/tmux/tmux/releases/download/2.8/tmux-2.8.tar.gz)
    - `CFLAGS="-I$HOME/.local/include" LDFLAGS="-L$HOME/.local/lib" ./configure --prefix=$HOME/.local`
    - libevent (https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz)
 4. tree-1.8.0 (http://mama.indstate.edu/users/ice/tree/src/tree-1.8.0.tgz)
