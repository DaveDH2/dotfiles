set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'ciaranm/detectindent'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-markdown'
Plugin 'lastpos.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'wavded/vim-stylus'
Plugin 'bling/vim-airline'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'burnettk/vim-angular'
Plugin 'vim-ruby/vim-ruby'
Plugin 'farseer90718/flattr.vim'
Plugin 'goatslacker/mango.vim'
Plugin 'marijnh/tern_for_vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'vim-scripts/OmniCppComplete'
Plugin 'Valloric/YouCompleteMe'
Plugin 'einars/js-beautify'
Plugin 'altercation/vim-colors-solarized'

let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

filetype plugin on

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" show statusline
set laststatus=2

" toggle paste mode
set pastetoggle=<F2>

"" tabs/spaces + highlight whitespace [1]
set list
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set shiftround
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]
set clipboard=unnamed

syntax enable
set regexpengine=1

function! Spaces(...)
    let l:width = a:0 == 1 ? a:1 : 4
    setlocal expandtab
    setlocal listchars=tab:>·,trail:·,extends:»,nbsp:·
    let &l:tabstop = l:width
    let &l:shiftwidth = l:width
    let &l:softtabstop = l:width
endfunction
call Spaces()

command! T setlocal noexpandtab softtabstop=0
            \ listchars=tab:\ \ ,trail:·,extends:»,nbsp:·
command! -nargs=? S call Spaces(<args>)

"" quick tab/spaces settings [3]
nmap <leader>t :T<CR>
nmap <leader>M :S 4<CR>
nmap <leader>m :S 2<CR>

autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>


autocmd Filetype gitcommit setlocal spell textwidth=72

set background=dark
colorscheme flattr
set t_Co=256

:set mouse=nicr
set relativenumber

set spelllang=en_us
set spell

inoremap jj <ESC>
let mapleader = ","

nmap <silent> <leader>s :set spell!<CR>

nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP

let g:angular_source_directory = 'app/source'
let g:angular_test_directory = 'test/units'
let g:angular_find_ignore = ['build/', 'dist/']
let g:angular_filename_convention = 'camelcased'
let g:syntastic_html_tidy_ignore_errors = ['proprietary attribute "myhotcompany-']
let g:syntastic_html_tidy_blocklevel_tags = ['myCustomTag']

let g:used_javascript_libs= 'jquery,underscore,backbone,angularjs,angularui,react,requirejs,jasmine,chai'

