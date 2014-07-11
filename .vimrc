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
set cindent
  

set smartindent
set autoindent
set expandtab
set wrap 

if has("autocmd")
  au BufRead *.coffee,*.py set nocindent noautoindent
  au BufRead *.php emenu Snippets.php
  "au BufRead *.php set tabstop =4 softtabstop =4 shiftwidth =4 expandtab
	au BufRead *.py filetype plugin indent on
  au BufRead *.py emenu Snippets.python
  au BufRead *.py set cinwords=if,elif,else,for,while,try,except,finally,def,class tabstop =4 softtabstop =4 shiftwidth =4 expandtab
  au BufRead *.haml,*.rb,*.erb set cinwords=if,elsif,else,unless,for,while,begin,rescue,def,class,module shiftwidth =2
    "au BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
    "au BufRead *.rb set smartindent cinwords=if,elsif,else,unless,for,while,begin,rescue,def,class,module
endif

syntax on
"set background=white
"hi Normal ctermfg=grey ctermbg=darkgrey
hi Normal ctermfg=darkgreen 
hi PreProc ctermfg=grey
hi Statement ctermfg=darkYellow
hi Type ctermfg=darkyellow
hi Function ctermfg=darkcyan
hi Identifier ctermfg=darkgreen
hi Special ctermfg=grey
hi Constant ctermfg=darkcyan
hi Comment ctermfg=magenta
au BufRead,BufNewFile *.rb hi rubySymbol ctermfg=green
au BufRead,BufNewFile *.as set ft=actionscript

"nnoremap <F2> :set invet <bar> retab!<CR>
"imap <F2> <Esc>:set invet <bar> retab!<CR>
let mapleader = "'"
nnoremap <leader>n :NERDTreeToggle<CR>
command NT NERDTree

"nnoremap <leader>gs :InsertBothGetterSetter<CR>
"command -range -buffer GS InsertBothGetterSetter


"noremap <leader>p :call PhpDocSingle()<CR> 
nnoremap <leader>p :call PhpDocSingle()<CR> 
vnoremap <leader>p :call PhpDocRange()<CR> 
command DOC PhpDoc

"nnoremap <leader> :call NERDComment(0, "toggle")<cr>
"let NERD_<filetype>_alt_style=1

"match when a line is over 120 chars
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%121v.\+/
"match ErrorMsg '\%>120v.+'


"refresh firefox from vim
"autocmd BufWriteCmd *.html,*.css,*.coffee,*.js,*.php :call Refresh_firefox()
autocmd BufWriteCmd *.html,*.css,*.gtpl :call Refresh_firefox()
function! Refresh_firefox()
  if &modified
    write
    silent !echo  'vimYo = content.window.pageYOffset;
          \ vimXo = content.window.pageXOffset;
          \ BrowserReload();
          \ content.window.scrollTo(vimXo,vimYo);
          \ repl.quit();'  |
          \ nc -w 1 localhost 4242 2>&1 > /dev/null
  endif
endfunction

"set runtimepath^=~/.vim/plugin/ctrlp.vim
execute pathogen#infect()
