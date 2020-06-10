" Vim syntax file
" Language:  xll


if exists("b:current_syntax")
 finish
endif

syn cluster			xllAtomCluster		contains=xllAtomBarSymbol,xllAtomList,xllAtomNmbr0,xllComment,xllDecl,xllFunc,xllLeadWhite
syn cluster			xllBaseListCluster	contains=xllAtom,xllAtomBarSymbol,xllAtomMark,xllBQList,xllBarSymbol,xllComment,xllConcat,xllDecl,xllFunc,xllKey,xllList,xllNumber,xllEscapeSpecial,xllSymbol,xllVar,xllLeadWhite
if exists("g:xll_instring")
 syn cluster			xllListCluster		contains=@xllBaseListCluster,xllString,xllInString,xllInStringString
else
 syn cluster			xllListCluster		contains=@xllBaseListCluster,xllString
endif


syn match xllSymbol	contained	![^()'`,"; \t]\+!
syn match xllBarSymbol	contained	!|..\{-}|!
if exists("g:xll_rainbow") && g:xll_rainbow != 0
 syn region xllParen0           matchgroup=hlLevel0 start="`\=(" end=")" skip="|.\{-}|" contains=@xllListCluster,xllParen1
 syn region xllParen1 contained matchgroup=hlLevel1 start="`\=(" end=")" skip="|.\{-}|" contains=@xllListCluster,xllParen2
 syn region xllParen2 contained matchgroup=hlLevel2 start="`\=(" end=")" skip="|.\{-}|" contains=@xllListCluster,xllParen3
 syn region xllParen3 contained matchgroup=hlLevel3 start="`\=(" end=")" skip="|.\{-}|" contains=@xllListCluster,xllParen4
 syn region xllParen4 contained matchgroup=hlLevel4 start="`\=(" end=")" skip="|.\{-}|" contains=@xllListCluster,xllParen5
 syn region xllParen5 contained matchgroup=hlLevel5 start="`\=(" end=")" skip="|.\{-}|" contains=@xllListCluster,xllParen6
 syn region xllParen6 contained matchgroup=hlLevel6 start="`\=(" end=")" skip="|.\{-}|" contains=@xllListCluster,xllParen7
 syn region xllParen7 contained matchgroup=hlLevel7 start="`\=(" end=")" skip="|.\{-}|" contains=@xllListCluster,xllParen8
 syn region xllParen8 contained matchgroup=hlLevel8 start="`\=(" end=")" skip="|.\{-}|" contains=@xllListCluster,xllParen9
 syn region xllParen9 contained matchgroup=hlLevel9 start="`\=(" end=")" skip="|.\{-}|" contains=@xllListCluster,xllParen0
else
 syn region xllList			matchgroup=xllParen start="("   skip="|.\{-}|"			matchgroup=xllParen end=")"	contains=@xllListCluster
 syn region xllBQList			matchgroup=PreProc   start="`("  skip="|.\{-}|"			matchgroup=PreProc   end=")"		contains=@xllListCluster
endif


syn match xllAtomMark			"'"
syn match xllAtom			"'("me=e-1			contains=xllAtomMark	nextgroup=xllAtomList
syn match xllAtom			"'[^ \t()]\+"			contains=xllAtomMark
syn match xllAtomBarSymbol		!'|..\{-}|!			contains=xllAtomMark
syn region xllAtom			start=+'"+			skip=+\\"+ end=+"+
syn region xllAtomList			contained			matchgroup=Special start="("	skip="|.\{-}|" matchgroup=Special end=")"	contains=@xllAtomCluster,xllString,xllEscapeSpecial
syn match xllAtomNmbr			contained			"\<\d\+"
syn match xllLeadWhite			contained			"^\s\+"


syn keyword xllFunc		<
syn keyword xllFunc		<=
syn keyword xllFunc		=	
syn keyword xllFunc		!=	
syn keyword xllFunc		>	
syn keyword xllFunc		>=
syn keyword xllFunc		+
syn keyword xllFunc		-
syn keyword xllFunc		*
syn keyword xllFunc		/
syn keyword xllFunc		and
syn keyword xllFunc		or
syn keyword xllFunc		not

syn keyword xllFunc		if
syn keyword xllFunc		when
syn keyword xllFunc		for
syn keyword xllFunc		case
syn keyword xllFunc		do
syn keyword xllFunc		return
syn keyword xllFunc		break

syn keyword xllFunc		set
syn keyword xllFunc		setf
syn keyword xllFunc		def
syn keyword xllFunc		del
syn keyword xllFunc		car
syn keyword xllFunc		cdr
syn keyword xllFunc		nth
syn keyword xllFunc		append
syn keyword xllFunc		string
syn keyword xllFunc		list
syn keyword xllFunc		map

syn keyword xllFunc		import
syn keyword xllFunc		exit
syn keyword xllFunc		echo
syn keyword xllFunc		input


syn region			xllString			start=+"+ skip=+\\\\\|\\"+ end=+"+	contains=@Spell
if exists("g:xll_instring")
 syn region			xllInString			keepend matchgroup=Delimiter start=+"(+rs=s+1 skip=+|.\{-}|+ matchgroup=Delimiter end=+)"+ contains=@xllBaseListCluster,xllInStringString
 syn region			xllInStringString		start=+\\"+ skip=+\\\\+ end=+\\"+ contained
endif


syn match xllNumber		"-\=\(\.\d\+\|\d\+\(\.\d*\)\=\)\([dDeEfFlL][-+]\=\d\+\)\="
syn match xllNumber		"-\=\(\d\+/\d\+\)"


syn match xllConcat		"\s\.\s"
syn match xllParenError	")"


syn cluster xllCommentGroup	contains=xllTodo,@Spell
syn match   xllComment		";.*$"				contains=@xllCommentGroup
syn match   xllComment		"#.*$"				contains=@xllCommentGroup
syn region  xllCommentRegion	start="(?" end="?)" contains=xllCommentRegion,@xllCommentGroup


syn sync lines=80


" ---------------------------------------------------------------------

if !exists("skip_xll_syntax_inits")

  hi def link xllCommentRegion		xllComment
  hi def link xllAtomNmbr		xllNumber
  hi def link xllAtomMark		xllMark
  hi def link xllInStringString	xllString

  hi def link xllAtom			Identifier
  hi def link xllAtomBarSymbol		Special
  hi def link xllBarSymbol		Special
  hi def link xllComment		Comment
  hi def link xllConcat		Statement
  hi def link xllDecl			Statement
  hi def link xllFunc			Statement
  hi def link xllKey			Type
  hi def link xllMark			Delimiter
  hi def link xllNumber		Number
  hi def link xllParenError		Error
  hi def link xllEscapeSpecial		Type
  hi def link xllString		String
  hi def link xllTodo			Todo
  hi def link xllVar			Statement

endif

let b:current_syntax = "xll"

" ---------------------------------------------------------------------
" vim: ts=8 nowrap fdm=marker
