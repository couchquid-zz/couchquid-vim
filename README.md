## Install

Git, Vim, ctags and ack is required.

1. Clone the repository

    ```
    $ git clone git://github.com/couchquid/couchquid-vim.git ~/.vim
    ```

2. Create a symbolic link for .vimrc

    ```
    ln -s ~/.vim/.vimrc ~/.vimrc

3. Install everything using Vundle

    ```
    $ vim +BundleInstall +qall
    ```

4. Compile YouCompleteMe

    ```
    $ cd ~/.vim/bundle/YouCompleteMe/ && ./install.sh --clang-completer
    ```

5. All done!


Default leader key is ','

## Plugins

* [Ack.vim](https://github.com/mileszs/ack.vim)

    ```
    Search with '<leader>a'
    ```
* [CtrlP.vim](https://github.com/kien/ctrlp.vim)

    ```
    Find files with '<leader>t'
    ```
* [delimitMate](https://github.com/Raimondi/delimitMate)
* [EasyMotion](https://github.com/vim-scripts/EasyMotion)
* [Gundo.vim](https://github.com/sjl/gundo.vim)

    ```
    Browse your undo list with '<leader>g'
    ```
* [NERDTree](https://github.com/scrooloose/nerdtree)

    ```
    Browse your files with '<leader>e'
    ```

* [tabular](https://github.com/godlygeek/tabular)
* [tagbar](https://github.com/majutsushi/tagbar)

    ```
    View tags in your file with '<leader>p'
    ```
* [vim-css-color](https://github.com/ap/vim-css-color)
* [vim-fugitive](https://github.com/tpope/vim-fugitive)
* [vundle](https://github.com/gmarik/vundle)
* [ZoomWin](https://github.com/vim-scripts/ZoomWin)

    ```
    Zoom on the file you are currently working with using '<leader>zw'
    ```

* [vim-surround](https://github.com/tpope/vim-surround)
* [MatchTagAlways](https://github.com/Valloric/MatchTagAlways)
* [numbers.vim](http://github.com/myusuf3/numbers.vim)

    ```
    Toggle linenumbers with <leader>n
    ```

* [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
* [vim-airline](https://github.com/bling/vim-airline)
* [syntastic]((https://github.com/scrooloose/syntastic)


## Languages

* [vim-coffee-script](https://github.com/kchmck/vim-coffee-script)
* [vim-javascript](https://github.com/pangloss/vim-javascript)
* [vim-markdown](https://github.com/tpope/vim-markdown)
* [vim-css-color](https://github.com/ap/vim-css-color)
* [vim-css3-syntax](https://github.com/hail2u/vim-css3-syntax)
* [html5.vim](https://github.com/othree/html5.vim)
* [Vim-Jinja2-Syntax](https://github.com/Glench/Vim-Jinja2-Syntax)

## Themes

* [molokai](https://github.com/tomasr/molokai)
