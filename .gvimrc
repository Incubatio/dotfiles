set go-=T
set bg=dark
if &background == "dark"
    hi normal guibg=black
    set transp=5
endif

" number of line and
set nu
set showmatch

set expandtab
set title

" hightlight and incremental search
set  hlsearch
set incsearch


"set autoindent 
"set smartindent
set tabstop =4 
set softtabstop =4 
set shiftwidth =4

set nocindent
set wrap

if has("autocmd")
    au FileType cpp,c,java,sh,pl,php set cindent
"   filetype plugin indent on 
    au FileType rb,py,php set cindent autoindent smartindent filetype plugin indent on
    au BufRead *.py emenu Snippets.python
    au BufRead *.php emenu Snippets.php
    au BufRead *.py set cinwords=if,elif,else,for,while,try,except,finally,def,class tabstop =4 softtabstop =4 shiftwidth =4
    au BufRead *.rb,*.erb set cinwords=if,elsif,else,unless,for,while,begin,rescue,def,class,module tabstop =2 softtabstop =2 shiftwidth =2 autoindent
    "au BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
    "au BufRead *.rb set smartindent cinwords=if,elsif,else,unless,for,while,begin,rescue,def,class,module
endif

syntax on
"set background=dark
"hi Normal ctermfg=grey ctermbg=darkgrey
hi PreProc ctermfg=magenta
hi Statement ctermfg=darkYellow
hi Type ctermfg=blue
hi Function ctermfg=blue
hi Identifier ctermfg=darkBlue
hi Special ctermfg=darkCyan
hi Constant ctermfg=darkCyan
hi Comment ctermfg=darkGreen
au BufRead,BufNewFile *.rb hi rubySymbol ctermfg=green
