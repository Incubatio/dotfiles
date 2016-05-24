set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif
set t_Co=256

let yellow = 11
let magenta = 5 "207, 94
let cyan = 6
let dark_cyan = 14 "30
let dark_green = 2 "34, 22
let green = 10
let grey = 246 "240
let white = 15 "235..249
let dark_grey = 233 "12 245
let red = 1 "160, 196
let blue = 4 "33
"let dark_blue = 23
let black = 232
let orange = 3 "130, 166, 202
let dark_orange = 9 "130, 166, 202

let base1 = dark_green
let base2 = yellow
"let base4 = dark_cyan
let base4 = cyan
let base3 = 245
let base5 = cyan


"hi Normal ctermfg=grey ctermbg=darkgrey
"exe 'hi Normal ctermbg='    . black
exe 'hi Normal ctermfg='    . base1 . ' ctermbg=' . black
exe 'hi Type ctermfg='      . base2

exe 'hi PreProc ctermfg='   . base5
exe 'hi Statement ctermfg=' . base2 . ' cterm=bold'
"exe 'hi Operator ctermfg='  . base1
exe 'hi Function ctermfg='  . base4 . ' cterm=bold'
exe 'hi Identifier ctermfg='. base2 . ' cterm=bold'

exe 'hi Special ctermfg='   . base5
exe 'hi Constant ctermfg='  . base5
exe 'hi Comment ctermfg='   . magenta
exe 'hi LineNr ctermfg='    . base2 . ' ctermbg=' . dark_grey
exe 'au BufRead,BufNewFile *.rb hi rubySymbol ctermfg=' . green

"match when a line is over 120 chars
exe 'hi OverLength ctermbg=' . red . ' ctermfg=' . white . ' guibg=' . red
match OverLength /\%121v.\+/
"match ErrorMsg '\%>120v.+'
exe 'hi Search ctermfg=' . red  . ' ctermbg=' . black . ' cterm=bold guifg=NONE guibg=NONE gui=underline'
exe 'hi IncSearch ctermfg=' . red  . ' ctermbg=' . black . ' cterm=bold guifg=NONE guibg=NONE gui=underline'
