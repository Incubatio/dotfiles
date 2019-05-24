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


" OmniSharp won't work without this setting
filetype plugin on

" Set the type lookup function to use the preview window instead of echoing it
"let g:OmniSharp_typeLookupInPreview = 1

" Timeout in seconds to wait for a response from the server
let g:OmniSharp_timeout = 5

" Don't autoselect first omnicomplete option, show options even if there is only
" one (so the preview documentation is accessible). Remove 'preview' if you
" don't want to see any documentation whatsoever.
set completeopt=longest,menuone,preview

" Fetch full documentation during omnicomplete requests.
" There is a performance penalty with this (especially on Mono).
" By default, only Type/Method signatures are fetched. Full documentation can
" still be fetched when you need it with the :OmniSharpDocumentation command.
"let g:omnicomplete_fetch_full_documentation = 1

" Set desired preview window height for viewing documentation.
" You might also want to look at the echodoc plugin.
set previewheight=5

" Fetch semantic type/interface/identifier names on BufEnter and highlight them
let g:OmniSharp_highlight_types = 1

augroup omnisharp_commands
    autocmd!

    " When Syntastic is available but not ALE, automatic syntax check on events
    " (TextChanged requires Vim 7.4)
    " autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " Update the highlighting whenever leaving insert mode
    autocmd InsertLeave *.cs call OmniSharp#HighlightBuffer()

    " Alternatively, use a mapping to refresh highlighting for the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>th :OmniSharpHighlightTypes<CR>

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-l> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateDown<CR>
augroup END

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

" Start the omnisharp server for the current solution
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>

" Enable snippet completion
" let g:OmniSharp_want_snippet=1

let g:OmniSharp_selector_ui = 'fzf'    " Use fzf.vim
"let g:OmniSharp_server_use_mono = 1
set completeopt-=preview
noremap ' <NOP>

" Tell ALE to use OmniSharp for linting C# files, and no other linters.
let g:ale_linters = { 'cs': ['OmniSharp'] }
nmap <silent> <C-l> <Plug>(ale_previous_wrap)
nmap <silent> <C-k> <Plug>(ale_next_wrap)
let g:ale_history_log_output = 1

let g:signify_vcs_list = [ 'git', 'perforce' ]
highlight SignifySignAdd    cterm=bold ctermbg=none  ctermfg=green
highlight SignifySignDelete cterm=bold ctermbg=none  ctermfg=red
highlight SignifySignChange cterm=bold ctermbg=none  ctermfg=172
highlight SignColumn ctermbg=NONE cterm=NONE guibg=NONE gui=NONE
let g:signify_sign_change = '~'
let g:signify_sign_changedelete      = g:signify_sign_change
