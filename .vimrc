"Begin Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-syntastic/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-obsession'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'honza/vim-snippets'
Plugin 'airblade/vim-gitgutter'

"End vundle
call vundle#end()
filetype plugin indent on


" Number of line and
set nu
set showmatch
set ruler


set title

" Hightlight and incremental search
set hlsearch
set incsearch

" Tab spacing
set tabstop =2
set softtabstop =2
set shiftwidth =2


"set cindent
"set smartindent
set autoindent
set expandtab
set wrap

set cc=100

if has("autocmd")
  "au BufRead *.coffee,*.py set nocindent noautoindent
  "au BufRead *.php emenu Snippets.php
  "au BufRead *.php set tabstop =4 softtabstop =4 shiftwidth =4 expandtab
  "au BufRead *.py filetype plugin indent on
  "au BufRead *.py emenu Snippets.python
  "au BufRead *.py set cinwords=if,elif,else,for,while,try,except,finally,def,class tabstop =4 softtabstop =4 shiftwidth =4 expandtab
  "au BufRead *.haml,*.rb,*.erb set cinwords=if,elsif,else,unless,for,while,begin,rescue,def,class,module shiftwidth =2
    "au BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
    "au BufRead *.rb set smartindent cinwords=if,elsif,else,unless,for,while,begin,rescue,def,class,module
  "au BufRead,BufNewFile *.as set ft=actionscript
endif

"nnoremap <F2> :set invet <bar> retab!<CR>
"imap <F2> <Esc>:set invet <bar> retab!<CR>
let mapleader = "'"
"nnoremap <leader>gs :InsertBothGetterSetter<CR>
"command -range -buffer GS InsertBothGetterSetter




"autocmd BufNewFile,BufRead * highlight trailing_spaces ctermbg=Red
"autocmd BufNewFile,BufRead * match trailing_spaces /\s\+$/



"nnoremap <leader> :call NERDComment(0, "toggle")<cr>
"let NERD_<filetype>_alt_style=1



"refresh firefox from vim
"autocmd BufWriteCmd *.html,*.css,*.coffee,*.js,*.php :call Refresh_firefox()
"autocmd BufWriteCmd *.html,*.css,*.gtpl :call Refresh_firefox()
"function! Refresh_firefox()
"  if &modified
"    write
"    silent !echo  'vimYo = content.window.pageYOffset;
"          \ vimXo = content.window.pageXOffset;
"          \ BrowserReload();
"          \ content.window.scrollTo(vimXo,vimYo);
"          \ repl.quit();'  |
"          \ nc -w 1 localhost 4242 2>&1 > /dev/null
"  endif
"endfunction


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


"execute pathogen#infect()
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ["actionscript", "haxe"] }
"nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

"noremap <leader>p :call PhpDocSingle()<CR>
nnoremap <leader>p :call PhpDocSingle()<CR>
vnoremap <leader>p :call PhpDocRange()<CR>
command DOC PhpDoc

"for vim-better-whitespace plugin
noremap <leader>l :StripWhitespace<CR>
noremap <leader>t :%s/\t/  /g<CR>
"inoremap <leader>n :!osascript /Users/igor/Documents/run.scpt <CR> <CR>
command NT NERDTree

"inoremap <esc> <NOP>
"noremap <esc> <NOP>
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

noremap ; l
noremap l k
noremap k j
noremap j h
"noremap   l  <NOP>
"noremap   h  <NOP>

inoremap <Backspace> <NOP>
noremap <Backspace> <NOP>


"inoremap <leader>w <esc>:w<CR>
"inoremap <C-space> <esc>:w<CR>
nnoremap <NUL> :w<CR>
inoremap <C-c>  <esc>
"inoremap jk <esc>:w<CR>
"inoremap kj <esc>:w<CR>

"compilation is now managed from tmux
"noremap <leader>b <C-c>:w<CR> :!osascript /Users/igor/Documents/compile.scpt <CR> <CR>
"noremap <leader>n :!osascript /Users/igor/Documents/run.scpt <CR> <CR>

syntax on
syntax enable
"set background=dark
set background=light
colorscheme turtle

"set background=white


let g:syntastic_html_tidy_ignore_errors = [
  \ 'trimming empty <i>',
  \ 'trimming empty <span>',
  \ '<input> proprietary attribute \"autocomplete\"',
  \ 'proprietary attribute \"role\"',
  \ 'proprietary attribute \"hidden\"',
  \ 'proprietary attribute \"ng-',
  \ '<svg> is not recognized!',
  \ 'discarding unexpected <svg>',
  \ 'discarding unexpected </svg>',
  \ '<rect> is not recognized!',
  \ '<path> is not recognized!',
  \ 'discarding unexpected </path>',
  \ 'discarding unexpected <path>',
  \ 'discarding unexpected <rect>',
  \ "'<' + '/' + letter not allowed here"
  \ ]
