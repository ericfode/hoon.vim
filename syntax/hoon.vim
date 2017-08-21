"hoon.vim: Hoon syntax file
" Eric Fode, Philip C Monk

if exists("b:current_syntax")
  finish
endif

set autoindent
map g/ /++  
nmap gs :let varname = '\<<C-R><C-W>\>'<CR>?++  <C-R>=varname<CR><CR>
set tabstop=2
set expandtab
set shiftwidth=2
" nmap gc :let &colorcolumn=join(range(81,999),",")<CR>
" nmap gC :let &colorcolumn=join(range(999,999),",")<CR>
" nmap ge :vertical resize 85<CR>

syn case match

" Declarations
hi def link     hoonArm           Keyword 
hi def link     hoonSymbol        Constant 
hi def link     hoonAtom          Constant
hi def link     hoonRune          Operator
hi def link     hoonIdentifier    Identifier
hi def link     hoonBranch        Conditional
hi def link     hoonType          Type
" hi def link     hoonName          Constant
hi def link     hoonNumber        Type
hi def link     hoonComment       Comment
hi def link     hoonTodo          Todo
hi def link     hoonString        String
hi def link     hoonSpecial       Number
hi def link     hoonColdString    Constant
hi def link     hoonLoobean       Boolean

syn match       hoonArm           "+[+-]" nextgroup=hoonSymbol skipwhite 
syn match       hoonSymbol        "[%\$](\w|-)+"
syn match       hoonAtom          /\%(@\w*\)|\^/
syn match       hoonName          "\w*" contained
syn match       hoonSymbolDec     "\w\w\+" contained contains=hoonName
syn match       hoonColdString    /\$\%(\w*\)/
syn match       hoonColdString    /[<>-\+\$]/
syn match       hoonSpecial       /[\~\.\@]/
syn match       hoonLoobean       /[|&]/
syn match       hoonLoobean       /[%\$]\.[yn]/


" numbers
" Numbers are in decimal, binary, hex, base32, or base64, and they must
" contain dots (optionally followed by whitespace), as in the German manner.

syn sync        linebreaks=1
syn match       hoonNumber        "\d\{1,3\}\%(\.\_s\?\d\{3\}\)*"
syn match       hoonNumber        "0x\x\{1,4\}\%(\.\_s*\x\{4\}\)*"
syn match       hoonNumber        "0b[01]\{1,4\}\%(\.\_s*[01]\{4\}\)*"
syn match       hoonNumber        "0v[0-9a-v]\{1,5\}\%(\.\_s*[0-9a-v]\{5\}\)*"
syn match       hoonNumber        "0w[-~0-9a-zA-Z]\{1,5\}\%(\.\_s*[-~0-9a-zA-Z]\{5\}\)*"

" comments

syn region      hoonComment       start="::" end="$" contains=@spell,hoonTodo

" strings

syn region      hoonString        start=+'+ skip=+\\[\\']+ end=+'+ contains=@spell
syn region      hoonBlock         start=+'''+ end=+'''+
syn region      hoonString        start=+"+ skip=+\\[\\"]+ end=+"+ contains=@spell


" match digraphs

syn match       hoonRune          "||"
syn match       hoonRune          "|_"
syn match       hoonRune          "|%"
syn match       hoonRune          "|:"
syn match       hoonRune          "|\."
syn match       hoonRune          "|-"
syn match       hoonRune          "|\^"
syn match       hoonRune          "|+"
syn match       hoonRune          "|\*"
syn match       hoonRune          "|="
syn match       hoonRune          "|?"
syn match       hoonRune          "|\/"
syn match       hoonRune          "%_"
syn match       hoonRune          "%:"
syn match       hoonRune          "%\."
syn match       hoonRune          "%\^"
syn match       hoonRune          "%+"
syn match       hoonRune          "%-"
syn match       hoonRune          "%\~"
syn match       hoonRune          "%\*"
syn match       hoonRune          "%="
syn match       hoonRune          "\$|"
syn match       hoonRune          "\$_"
syn match       hoonRune          "\$:"
syn match       hoonRune          "\$%"
syn match       hoonRune          "\$,"
syn match       hoonRune          "\$&"
syn match       hoonRune          "\$?"
syn match       hoonRune          "\$+"
syn match       hoonRune          "\$="
syn match       hoonRune          ":_"
syn match       hoonRune          ":\~"
syn match       hoonRune          ":/"
syn match       hoonRune          ":\^"
syn match       hoonRune          ":+"
syn match       hoonRune          ":-"
syn match       hoonRune          ":\~"
syn match       hoonRune          ":\*"
syn match       hoonRune          "\.+"
syn match       hoonRune          "\.\*"
syn match       hoonRune          "\.="
syn match       hoonRune          "\.?"
syn match       hoonRune          "\.\^"
syn match       hoonRune          "#<"
syn match       hoonRune          "#>"
syn match       hoonRune          "\^|"
syn match       hoonRune          "\^\."
syn match       hoonRune          "\^-"
syn match       hoonRune          "\^+"
syn match       hoonRune          "\^&"
syn match       hoonRune          "\^\~"
syn match       hoonRune          "\^="
syn match       hoonRune          "\^?"
syn match       hoonRune          "\~|"
syn match       hoonRune          "\~\$"
syn match       hoonRune          "\~%"
syn match       hoonRune          "\~:"
syn match       hoonRune          "\~/"
syn match       hoonRune          "\~<"
syn match       hoonRune          "\~>"
syn match       hoonRune          "\~#"
syn match       hoonRune          "\~\^"
syn match       hoonRune          "\~+"
syn match       hoonRune          "\~&"
syn match       hoonRune          "\~="
syn match       hoonRune          "\~?"
syn match       hoonRune          "\~!"
syn match       hoonRune          ";_"
syn match       hoonRune          ";,"
syn match       hoonRune          ";%"
syn match       hoonRune          ";:"
syn match       hoonRune          ";/"
syn match       hoonRune          ";\."
syn match       hoonRune          ";<"
syn match       hoonRune          ";>"
syn match       hoonRune          ";-"
syn match       hoonRune          ";+"
syn match       hoonRune          ";&"
syn match       hoonRune          ";\~"
syn match       hoonRune          ";;"
syn match       hoonRune          ";\*"
syn match       hoonRune          ";="
syn match       hoonRune          ";?"
syn match       hoonRune          "\%([^a-zA-Z]\|^\)\zs=|"
syn match       hoonRune          "\%([^a-zA-Z]\|^\)\zs=\."
syn match       hoonRune          "\%([^a-zA-Z]\|^\)\zs=\^"
syn match       hoonRune          "\%([^a-zA-Z]\|^\)\zs=:"
syn match       hoonRune          "\%([^a-zA-Z]\|^\)\zs=<"
syn match       hoonRune          "\%([^a-zA-Z]\|^\)\zs=>"
syn match       hoonRune          "\%([^a-zA-Z]\|^\)\zs=-"
syn match       hoonRune          "\%([^a-zA-Z]\|^\)\zs=+"
syn match       hoonRune          "\%([^a-zA-Z]\|^\)\zs=\*"
syn match       hoonRune          "\%([^a-zA-Z]\|^\)\zs=\~"
syn match       hoonRune          "\%([^a-zA-Z]\|^\)\zs=/"
syn match       hoonRune          "\%([^a-zA-Z]\|^\)\zs=,"
syn match       hoonRune          "?|"
syn match       hoonRune          "?:"
syn match       hoonRune          "?\."
syn match       hoonRune          "?<"
syn match       hoonRune          "?>"
syn match       hoonRune          "?-"
syn match       hoonRune          "?\^"
syn match       hoonRune          "?="
syn match       hoonRune          "?+"
syn match       hoonRune          "?&"
syn match       hoonRune          "?@"
syn match       hoonRune          "?\~"
syn match       hoonRune          "?!"
syn match       hoonRune          "!:"
syn match       hoonRune          "!,"
syn match       hoonRune          "!;"
syn match       hoonRune          "!\^"
syn match       hoonRune          "!>"
syn match       hoonRune          "!="

" Not technically runes, but we highlight them like that.
syn match       hoonRune          "\%([^a-zA-Z]\|^\)\zs=="
syn match       hoonRune          "--"

let b:current_syntax = "hoon"

