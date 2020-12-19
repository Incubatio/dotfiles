"Begin Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-obsession'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'honza/vim-snippets'
Plugin 'mhinz/vim-signify'
Plugin 'nfvs/vim-perforce'
Plugin 'tpope/vim-surround'
"Plugin 'valloric/youcompleteme'
Plugin 'w0rp/ale'
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'fatih/vim-go'
Plugin 'rust-lang/rust.vim'
Plugin 'neoclide/coc.nvim'


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

set tabstop=2 softtabstop=2 shiftwidth=2

"set cindent
"set smartindent
set autoindent
set expandtab
set wrap

set cc=100

if has("autocmd")
  autocmd BufRead,BufNewFile *.as set filetype=actionscript
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

"for vim-better-whitespace plugin
noremap <leader>l :StripWhitespace<CR>
noremap <leader>t :%s/\t/  /g<CR>
"inoremap <leader>n :!osascript /Users/igor/Documents/run.scpt <CR> <CR>
command NT NERDTree

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
noremap <C-n> <NOP>

inoremap <Backspace> <NOP>
noremap <Backspace> <NOP>

nnoremap <NUL> :w<CR>
inoremap <C-c>  <esc>
nnoremap <C-p> :FZF<CR>

syntax on
syntax enable
"set background=dark
set background=light
colorscheme turtle

"set background=white

let g:perforce_open_on_change=1
let g:perforce_prompt_on_open=0

nmap <silent> <C-l> <Plug>(ale_previous_wrap)
nmap <silent> <C-k> <Plug>(ale_next_wrap)
let g:ale_history_log_output = 1
let g:ale_sign_error = "✗"
let g:ale_sign_warning = "⚠"

let g:signify_vcs_list = [ 'git', 'perforce' ]
highlight SignifySignAdd    cterm=bold ctermbg=none  ctermfg=green
highlight SignifySignDelete cterm=bold ctermbg=none  ctermfg=red
highlight SignifySignChange cterm=bold ctermbg=none  ctermfg=172
highlight SignColumn ctermbg=NONE cterm=NONE guibg=NONE gui=NONE
let g:signify_sign_change = '~'
let g:signify_sign_changedelete      = g:signify_sign_change


if has("autocmd")
  au BufRead *.cs source ~/.vim/omnisharp.vim
  au BufRead *.rs source ~/.vim/rust.vim
endif

"enable per project .vimrc
set exrc
set secure
