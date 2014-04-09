filetype off

let isNpmInstalled = executable("npm")

if has('vim_starting')
    set nocompatible

    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

let g:make = 'gmake'
if system('uname -o') =~ '^GNU/'
    let g:make = 'make'
endif

NeoBundle 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
\ 'build' : {
\       'mac' : 'make -f make_mac.mak',
\       'unix': g:make
\       },
\ }

NeoBundle 'vim-scripts/tlib'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'honza/vim-snippets'

NeoBundle 'Raimondi/delimitMate'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Valloric/MatchTagAlways'
NeoBundle 'myusuf3/numbers.vim'
NeoBundle 'tomtom/tcomment_vim'

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'JazzCore/ctrlp-cmatcher'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'tpope/vim-dispatch'

NeoBundle 'mileszs/ack.vim'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'bronson/vim-trailing-whitespace'

if has("python")
    NeoBundle 'marijnh/tern_for_vim'
    if isNpmInstalled && isdirectory(expand('~/.vim/bundle/tern_for_vim')) && !isdirectory(expand('~/.vim/bundle/tern_for_vim/node_modules'))
        silent ! echo 'Installing tern' && npm --prefix ~/.vim/bundle/tern_for_vim install
    endif
endif

NeoBundle 'bling/vim-airline'
NeoBundle 'scrooloose/syntastic'

if !executable("jshint")
    let g:syntastic_jshint_exec = '~/.vim/node_modules/.bin/jshint'
    if isNpmInstalled && !executable(expand(g:syntastic_jshint_exec))
        silent ! echo 'Installing jshint' && npm --prefix ~/.vim/ install jshint
    endif
endif

if !executable("csslint")
    let g:syntastic_css_csslint_exec = '~/.vim/node_modules/.bin/csslint'
    if isNpmInstalled && !executable(expand(g:syntastic_css_csslint_exec))
        silent ! echo 'Installing csslint' && npm --prefix ~/.vim/ install csslint
    endif
endif

NeoBundle 'tomasr/molokai'

NeoBundle 'tpope/vim-markdown'
NeoBundle 'ap/vim-css-color'
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'lukaszb/vim-web-indent'
NeoBundle 'jelera/vim-javascript-syntax', {'autoload':{'filetype':['javascript']}}
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'othree/html5.vim'
NeoBundle 'Glench/Vim-Jinja2-Syntax'
NeoBundle 'othree/javascript-libraries-syntax.vim'

filetype plugin indent on           " Automatically detect filetypes
syntax on                           " Turn on syntax hightlighting

NeoBundleCheck

" Unite
let g:unite_winheight = 10
let g:unite_enable_start_insert = 1
let g:unite_split_rule = 'botright'
let g:unite_source_file_mru_limit = 100
let g:unite_source_history_yank_enable = 1
let g:unite_source_history_yank_limit = 40
let g:unite_source_grep_defaults_opts = '-iRHns'
let g:unite_source_rec_max_cache_files = 99999

if executable('ack-grep')
    let g:unite_source_grep_command = 'ack-grep'
    let g:unite_source_grep_default_opts = '--no-heading --no-color -a -H'
    let g:unite_source_grep_recursive_opt = ''
endif

nnoremap <leader>m :<C-u>Unite file_mru <CR>
nnoremap <leader>h :Unite -quick-match -max-multi-lines=2 -start-insert -auto-quit history/yank<CR>
nnoremap <leader>' :Unite -quick-match -auto-quit tab<CR>
nnoremap <leader>; :Unite file_rec/async -start-insert<CR>
nnoremap <leader>/ :Unite grep:. -no-start-insert -no-quit -keep-focus -wrap<CR>

" NERDTree
let NERDTreeShowHidden=1
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>e :NERDTreeToggle<CR>

" Syntastic

let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1

let g:syntastic_always_populate_loc_list=1
nmap <silent> <leader>ll :Errors<cr>
nmap <silent> [ :lprev<cr>
nmap <silent> ] :lnext<cr>

let g:syntastic_python_checkers = ['pep8', 'pylint']
let g:syntastic_python_pep8_args='--ignore=E302,E711,E126,E128'
let g:syntastic_json_checkers = ['jsonlint']

" JS syntax libs
let g:used_javascript_libs = 'backbone'

" DelimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" Tern_for_vim
nmap <leader>td :TernDef<CR>
nmap <leader>tr :TernRefs<CR>
nmap <leader>tn :TernRename<CR>

" neosnippets

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
let g:neosnippet#disable_runtime_snippets = { '_' : 1 }

imap <expr><CR> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<CR>"

" vim-airline

let g:airline_theme = 'understated'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#fnamemod = ':t'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

" disable preview in code complete
set completeopt-=preview

set splitbelow                      " Split window below current window
set splitright                      " Split window to the right of current window
set history=50                      " Keep last 50 commands in history
set timeoutlen=500                  " Less timeout after pressing leader key
set scrolloff=35
set backspace+=start,eol,indent

autocmd BufEnter * :syntax sync fromstart " Syntax highlighting from start
set gcr=a:blinkon0                  " Disable blinking cursor
set fileformats=unix,dos,mac        " Set fileformat
set hidden                          " Switch between buffers without saving
set encoding=utf-8                  " Use utf-8 encoding
set noeol                           " Dont add eol at the end of file

" Backup
set nobackup
set noswapfile

set t_Co=256
set background=dark
colorscheme molokai

" Theme settings
hi cursorline cterm=NONE ctermbg=236
set cursorline
set guifont=Inconsolata:h13
set guioptions-=L
set guioptions-=r
set noshowmode
set title
set shortmess=atI
set nostartofline
set fillchars+=vert:\ 
hi vertsplit guibg=bg ctermbg=bg
hi signcolumn guibg=bg ctermbg=bg
hi linenr guibg=bg ctermbg=bg

set number                          " Linenumbers
set linespace=3                    " Slightly higher line height
set showmatch                       " Show matching parenthesis/brackets
set listchars=tab:>.,trail:.,extends:#,nbsp:. " Highlight whitespace
set showtabline=0                   " Never show the tabline
set laststatus=2                    " Always show the statusline

" Search
set incsearch                       " Find as you type
set hlsearch                        " Hilight search terms
set ignorecase                      " Case-insensitive searching
set smartcase                       " But case-sensitive if expression have a capital letter

" Formatting
set nowrap                          " Don't wrap long lines
set shiftwidth=4                    " Indents are 4 spaces long
set tabstop=4                       " How many spaces a tab is
set softtabstop=4                   " Backspace delete indents
set expandtab                       " Use spaces for indentation instead of tabs
set pastetoggle=<F12>               " Try and make indentation better on pastes

set ttimeoutlen=50

" Javascript indentation
au FileType javascript set shiftwidth=2 tabstop=2 softtabstop=2

" HTML indentation
au FileType html set shiftwidth=2 tabstop=2 softtabstop=2
au FileType jinja set shiftwidth=2 tabstop=2 softtabstop=2
au FileType python set shiftwidth=4 tabstop=4 softtabstop=4

" Use same settings for JSON as Javascript
au BufNewFile,BufRead *.json set ft=javascript

au BufNewFile,BufRead *.html set ft=htmldjango

" Key remaps
let mapleader = ','                     " Map leader to ,

" Split windows
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>s <C-w>s

" Turn of search highlighting
nnoremap <leader>k :nohlsearch<CR><CR>

" Plugin bindings
nmap <leader>a <ESC>:Ack!
nnoremap <leader>g :GundoToggle<CR>
map <leader>t :CtrlP<CR>

" Switch Windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set wildmenu
set wildcharm=<TAB>

let javaScript_fold=1
set foldlevelstart=99
set nofoldenable

nmap <space> za

" CtrlP
let g:ctrlp_match_func = {'match': 'matcher#cmatch' }
let g:ctrlp_working_path_mode = 'r'
set wildignore+=*bower_components*,*whoosh*
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\.pyc$',
    \ }

" NerdTree
let NERDTreeShowBookmarks=0         " Dont show bookmarks
let NERDTreeIgnore=['\.pyc', '.git', '.db']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeKeepTreeInNewTab=1

" Numbers.vim
nnoremap <leader>n :NumbersToggle<CR>

" ack-ag
let g:ackprg = 'ag --nogroup --nocolor --column --ignore-dir=bower_components --ignore=app.min.js'

if has("autocmd")
    augroup vimrc
    au!
        au BufWritePost *.vim source $MYVIMRC | AirlineRefresh
        au BufWritePost .vimrc source $MYVIMRC | AirlineRefresh

        au FileType javascript* call JavaScriptFold()
    augroup END
endif

if exists('$ITERM_PROFILE')
    if exists('$TMUX')
        let &t_SI = "\<Esc>[3 q"
        let &t_EI = "\<Esc>[0 q"
    else
        let &t_SI = "\<Esc>]50;CursorShape=1\x7"
        let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    endif
end
