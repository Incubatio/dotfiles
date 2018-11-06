set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif
set t_Co=256

let yellow = 11
let magenta = 4 "207, 94
let cyan = 6
let dark_cyan = 14 "30
let dark_green = 2 "34, 22
let green = 10
let grey = 246 "240
let white = 15 "235..249
let dark_grey = 249
let red = 1 "160, 196
let dark_red = 9 "160, 196
let blue = 4 "33
let dark_blue = 12
let dark_black = 0 "232
let black = 8 "232
let orange = 3 "130, 166, 202
let dark_orange = 208 "9, 130, 166, 202
let purple = 13

let base1 = green
let base2 = dark_green
let base4 = yellow
let base5 = purple
let base6 = purple
let base7 = yellow
let base8 = orange


"hi Normal ctermfg=grey ctermbg=darkgrey
"exe 'hi Normal ctermbg='    . black
exe 'hi Normal ctermfg='    . base1 . ' ctermbg=' . dark_black
exe 'hi Type ctermfg='      . base2

exe 'hi PreProc ctermfg='   . base5
exe 'hi Statement ctermfg=' . base4
"exe 'hi Operator ctermfg='  . base7
exe 'hi Function ctermfg='  . base4
exe 'hi Identifier ctermfg='. base7

exe 'hi Special ctermfg='   . base7
exe 'hi Constant ctermfg='  . base8
exe 'hi Comment ctermfg='   . grey
exe 'hi LineNr ctermfg='    . grey . ' ctermbg=' . dark_blue
exe 'au BufRead,BufNewFile *.rb hi rubySymbol ctermfg=' . green

"match when a line is over 120 chars
exe 'hi OverLength ctermbg=' . red . ' ctermfg=' . white
match OverLength /\%121v.\+/
"match ErrorMsg '\%>120v.+'
exe 'hi Search ctermfg=' . dark_black  . ' ctermbg=' . yellow . ' cterm=bold guifg=NONE guibg=NONE gui=underline'
exe 'hi IncSearch ctermfg=' . dark_black  . ' ctermbg=' . yellow . ' cterm=bold guifg=NONE guibg=NONE gui=underline'
"exe 'hi TabLineFill ctermfg=LightGreen ctermbg=DarkGreen
exe 'hi TabLine ctermbg='      . dark_blue . ' ctermfg=' . grey
exe 'hi TabLineSel ctermfg='  . dark_green . ' ctermbg=' . 0

