" Vim syntax file
" Language:    Xlang

" quit when a syntax file was already loaded.
if exists("b:current_syntax")
  finish
endif

" We need nocompatible mode in order to continue lines with backslashes.
" Original setting will be restored.
let s:cpo_save = &cpo
set cpo&vim

if exists("xlang_no_doctest_highlight")
  let xlang_no_doctest_code_highlight = 1
endif

if exists("xlang_highlight_all")
  if exists("xlang_no_builtin_highlight")
    unlet xlang_no_builtin_highlight
  endif
  if exists("xlang_no_doctest_code_highlight")
    unlet xlang_no_doctest_code_highlight
  endif
  if exists("xlang_no_doctest_highlight")
    unlet xlang_no_doctest_highlight
  endif
  if exists("xlang_no_exception_highlight")
    unlet xlang_no_exception_highlight
  endif
  if exists("xlang_no_number_highlight")
    unlet xlang_no_number_highlight
  endif
  let xlang_space_error_highlight = 1
endif

syn keyword xlangStatement    end return
syn keyword xlangStatement    class fn nextgroup=xlangFunction skipwhite
syn keyword xlangConditional  if elif else
syn keyword xlangRepeat       for while
syn keyword xlangOperator     and not or
syn keyword xlangException    except finally raise try
syn keyword xlangInclude      import
syn keyword xlangAsync        async await

syn match   xlangFunction    "\h\w*" display contained

syn match   xlangComment     "#.*$" contains=xlangTodo,@Spell
syn keyword xlangTodo        FIXME NOTE TODO XXX contained

syn region  xlangString matchgroup=xlangQuotes
      \ start=+[uU]\=\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1"
      \ contains=xlangEscape,@Spell
syn region  xlangString matchgroup=xlangTripleQuotes
      \ start=+[uU]\=\z('''\|"""\)+ skip=+\\["']+ end="\z1" keepend
      \ contains=xlangEscape,xlangSpaceError,xlangDoctest,@Spell
syn region  xlangRawString matchgroup=xlangQuotes
      \ start=+[uU]\=[rR]\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1"
      \ contains=@Spell
syn region  xlangRawString matchgroup=xlangTripleQuotes
      \ start=+[uU]\=[rR]\z('''\|"""\)+ end="\z1" keepend
      \ contains=xlangSpaceError,xlangDoctest,@Spell

syn match   xlangEscape    +\\[abfnrtv'"\\]+ contained
syn match   xlangEscape    "\\\o\{1,3}" contained
syn match   xlangEscape    "\\x\x\{2}" contained
syn match   xlangEscape    "\%(\\u\x\{4}\|\\U\x\{8}\)" contained
" xlang allows case-insensitive Unicode IDs: http://www.unicode.org/charts/
syn match   xlangEscape    "\\N{\a\+\%(\s\a\+\)*}" contained
syn match   xlangEscape    "\\$"

if !exists("xlang_no_number_highlight")
  " numbers (including longs and complex)
  syn match   xlangNumber    "\<0[oO]\=\o\+[Ll]\=\>"
  syn match   xlangNumber    "\<0[xX]\x\+[Ll]\=\>"
  syn match   xlangNumber    "\<0[bB][01]\+[Ll]\=\>"
  syn match   xlangNumber
    \ "\<\d\+\.\%([eE][+-]\=\d\+\)\=[jJ]\=\%(\W\|$\)\@="
  syn match   xlangNumber
    \ "\%(^\|\W\)\zs\d*\.\d\+\%([eE][+-]\=\d\+\)\=[jJ]\=\>"
endif

if !exists("xlang_no_builtin_highlight")
  " built-in constants
  syn keyword xlangBuiltin    nil true false
  " built-in functions
  syn keyword xlangBuiltin    int float string
  syn keyword xlangBuiltin    addrof typeof typenameof
  syn keyword xlangBuiltin    print println
  " avoid highlighting attributes as builtins
  syn match   xlangAttribute    /\.\h\w*/hs=s+1
    \ contains=ALLBUT,xlangBuiltin,xlangFunction,xlangAsync
    \ transparent
endif

if !exists("xlang_no_exception_highlight")
  syn keyword xlangExceptions    Exception
endif

if exists("xlang_space_error_highlight")
  " trailing whitespace
  syn match   xlangSpaceError    display excludenl "\s\+$"
  " mixed tabs and spaces
  syn match   xlangSpaceError    display " \+\t"
  syn match   xlangSpaceError    display "\t\+ "
endif

if !exists("xlang_no_doctest_highlight")
  if !exists("xlang_no_doctest_code_highlight")
    syn region xlangDoctest
      \ start="^\s*>>>\s" end="^\s*$"
      \ contained contains=ALLBUT,xlangDoctest,xlangFunction,@Spell
    syn region xlangDoctestValue
      \ start=+^\s*\%(>>>\s\|\.\.\.\s\|"""\|'''\)\@!\S\++ end="$"
      \ contained
  else
    syn region xlangDoctest
      \ start="^\s*>>>" end="^\s*$"
      \ contained contains=@NoSpell
  endif
endif

syn sync match xlangSync grouphere NONE "^\%(def\|class\)\s\+\h\w*\s*[(:]"

hi def link xlangStatement     Statement
hi def link xlangConditional   Conditional
hi def link xlangRepeat        Repeat
hi def link xlangOperator      Operator
hi def link xlangException     Exception
hi def link xlangInclude       Include
hi def link xlangAsync         Statement
hi def link xlangFunction      Function
hi def link xlangComment       Comment
hi def link xlangTodo          Todo
hi def link xlangString        String
hi def link xlangRawString     String
hi def link xlangQuotes        String
hi def link xlangTripleQuotes  xlangQuotes
hi def link xlangEscape        Special
if !exists("xlang_no_number_highlight")
  hi def link xlangNumber      Number
endif
if !exists("xlang_no_builtin_highlight")
  hi def link xlangBuiltin     Function
endif
if !exists("xlang_no_exception_highlight")
  hi def link xlangExceptions  Structure
endif
if exists("xlang_space_error_highlight")
  hi def link xlangSpaceError  Error
endif
if !exists("xlang_no_doctest_highlight")
  hi def link xlangDoctest     Special
  hi def link xlangDoctestValue Define
endif

let b:current_syntax = "xlang"

let &cpo = s:cpo_save
unlet s:cpo_save

" vim:set sw=2 sts=2 ts=8 noet:
