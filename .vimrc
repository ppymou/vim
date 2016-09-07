set nocompatible
filetype off

set cc=100

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

" General Settings
syn on
set nu
set smartindent
set expandtab
set nofoldenable
set hidden       " Hide buffer
set autowrite    " autosave buffer changes
set autowriteall " autosave buffer changes

" set term=xterm-256color
set t_Co=256

set tabstop=4
set softtabstop=4
set shiftwidth=4
set wildchar=<Tab> wildmenu wildmode=full
set foldmethod=indent
set pastetoggle=<F2>

" Search Options
set incsearch
set ignorecase
set smartcase
set hlsearch

" Make mouse interactive
set mouse=a

" Tags settings
set tags=./tags;~/authbox

" Performance tricks
set nocursorcolumn
set nocursorline
set norelativenumber
set synmaxcol=200
set lazyredraw " to avoid scrolling problems
syntax sync minlines=256

" Key mapping
imap jk <Esc>
imap <C-c> <Esc>

nmap \q :nohlsearch<CR>
nmap j gj
nmap k gk
nmap <c-l> :redraw!<CR>

nmap <c-m> <c-y>,
let g:tagbar_usearrows = 1

" mv between splits
nmap <c-k> <C-W>l
nmap <c-j> <C-W>h
nmap <S-m> :bp<CR>
nmap mm :bn<CR>

" http://stackoverflow.com/questions/2600783/how-does-the-vim-write-with-sudo-trick-work
cmap w!! w !sudo tee > /dev/null %

noremap <F1> <Esc>:syntax sync fromstart<CR>
inoremap <F1> <C-o>:syntax sync fromstart<CR>

noremap <F3> <Esc>:'<,'>Tab/=/l1<CR>
inoremap <F3> <C-o>:'<,'>Tab/=/l1<CR>

noremap <F4> <Esc>:'<,'>Tab/:/l1<CR>
inoremap <F4> <C-o>:'<,'>Tab/:/l1<CR>

noremap <F5> <Esc>:silent %!xmllint --encode UTF-8 --format -
inoremap <F5> <C-o>:silent %!xmllint --encode UTF-8 --format -

noremap <F6> <Esc>:set ft=html<CR>
inoremap <F6> <C-o>:set ft=html<CR>

noremap <F7> <Esc>:set ft=javascript<CR>
inoremap <F7> <C-o>:set ft=javascript<CR>

noremap <F8> :Autoformat<CR><CR>
inoremap <F8> :Autoformat<CR><CR>

noremap <c-c> <Esc>
inoremap <c-c> <Esc>

filetype plugin indent on

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_clear_cache_on_exit = 0

" Load AutoComplete only for certain files
au BufNewFile,BufRead *.partial,*.handlebars set filetype=html
au BufNewFile,BufRead *.jsx set filetype=javascript
au BufWrite * :DeleteTrailingWhitespace
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,partial,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag.vim/plugin/closetag.vim
autocmd FileType coffee,javascript,scala,html,css,scss setlocal shiftwidth=2 tabstop=2 sts=2 " Two spaces for
autocmd FileType html,json,ruby,yaml,cpp,javascript,scala,html,css,scss setlocal shiftwidth=2 tabstop=2 sts=2 " Two spaces for
autocmd FileType python set cc=80
autocmd FileType python inoremap # X<BS>#
autocmd FileType scala set cc=100

" Bundles"
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"Plugin 'kopischke/vim-stay'
Plugin 'bling/vim-airline'
"Plugin 'Valloric/YouCompleteMe'
"let g:ycm_auto_trigger = 1
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_min_num_of_chars_for_completion = 2
"let g:ycm_server_log_level = 'critical'
"let g:ycm_global_ycm_extra_conf = '/home/paul/dev/dotfiles/.ycm_extra_conf.py'

Plugin 'vim-scripts/closetag.vim'
Plugin 'scrooloose/syntastic'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_python_python_exec='python3'
let g:syntastic_python_checker_args = '--ignore=E225'
nnoremap <C-w>e :SyntasticCheck<CR>

Plugin 'ternjs/tern_for_vim'
" Plugin 'vim-scripts/closetag.vim'

"Plugin 'wincent/Command-T'
let g:CommandTMaxFiles = 900000
let g:CommandTInputDebounce = 50
let g:CommandTMaxCachedDirectories = 1000
let g:CommandTFileScanner = 'git'
set wildignore+=node_modules
set wildignore+=build

Plugin 'fatih/vim-go'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'flazz/vim-colorschemes'
Plugin 'wellsjo/wellsokai.vim'
Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'ervandew/supertab'
Plugin 'mattn/emmet-vim'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-surround'
"Plugin 'valloric/MatchTagAlways'
Plugin 'elzr/vim-json'
Plugin 'ap/vim-css-color'

Plugin 'Chiel92/vim-autoformat'
" Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'myusuf3/numbers.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'tpope/vim-fugitive'
" let g:rustfmt_autosave = 1

" Experimental
Plugin 'tpope/vim-abolish'

call vundle#end()            " required
filetype plugin indent on    " required

" au BufWritePost *.coffee silent make!

set laststatus=2
set background=dark

syntax enable
filetype off
filetype on

" ???
let g:pymode_rope_complete_on_dot = 0

" Match tag always
let g:mta_use_matchparen_group = 1

" Airline
let g:airline#extensions#tabline#enabled = 1

" Go format
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Unite
nnoremap <space>/ :Unite grep:.<cr>
nnoremap <space>s :Unite -quick-match buffer<cr>

" EasyMotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" 'Global' buffer
vmap <leader>y :w! ~/.vitmp<CR>
nmap <leader>p :r! cat ~/.vitmp<CR>

" Custom Macro
let @t = 'dwiimport wwxifromwdwds($'

colorscheme wellsokai
com! FormatJSON %!python -m json.tool

" Set _ as keyword
" set iskeyword-=_
