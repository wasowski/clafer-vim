if &compatible || v:version < 603 || exists("b:current_syntax")
	finish
endif

" NOTE: later groups have priority over earlier; so shorter matches first!
" Observe that the order of the file is now carefully tuned to the matching
" algorithm's behavior, so resist any urge to refactor the order.  It does
" have semantics

" basic tokens
syn region	CfrString		start=/\m"/  skip=/\m\\"/  end=/\m"/ containedin=CfrConstr
syn match	CfrIdentifier	/\m\h\w*/ containedin=CfrConstr
syn keyword CfrType 			int integer string real clafer
syn keyword Error				int integer string real clafer containedin=CfrConstr contained
syn keyword	CfrKeyword 		abstract enum 
syn keyword Error				abstract enum containedin=CfrConstr contained
syn keyword BCfrKeyword		final history initial
syn keyword Error				final history initial containedin=CfrConstr contained

" single character operators and punctuation 
syn match CfrLeakingPunctuation	/\m\.\|=\|#/ containedin=CfrConstr
syn match CfrConstrPunctuation	"\m-\|/\||\|<\|>\|(\|)\|\\" containedin=CfrConstr contained
syn match Error						"\m-\|/\||\|<\|>\|(\|)\|\\\|#"

" general rule for +/* in the in toplevel mode
syn match CfrCardinality /\*\|+/

" numeric constants
syn match CfrNumber	/\m[-+]\?\d\+/			containedin=CfrConstr
syn match Error		/\m[-+]\?\d\+\a\+/	containedin=CfrConstr

" in the constraint mode, always see operators as such (not as signs)
syn match CfrConstrPunctuation /\*\|+\|-/ containedin=CfrConstr contained

" cardinalities
syn keyword CfrCardinality xor mux or
syn keyword Error xor mux or containedin=CfrConstr contained
syn match	CfrCardinality /\m\(\(\d\+\|\*\)\.\.\(\d\+\|\*\)\)\|?/
syn match	Error /\m\(\(\d\+\|\*\)\.\.\(\d\+\|\*\)\)\|?/ containedin=CfrConstr contained 

" subtyping constructs
syn match CfrTopLevelPunctuation /:/ containedin=CfrConstr
syn match CfrTopLevelPunctuation	/\m->>\|->/
syn match Error						/\m->>\|->/ containedin=CfrConstr contained

" multi character operators and punctuation
syn match CfrConstrPunctuation	/\m||\|++\|!=/ containedin=CfrConstr contained
syn match Error						/\m||\|++\|!=/
syn match CfrConstrPunctuation	/\m<:\|:>/ containedin=CfrConstr contained
syn match Error						/\m<:\|:>/
syn match CfrConstrPunctuation	/\m&&\|>=\|<=\|=>\|<=>/ containedin=CfrConstr contained
syn match Error						/\m&&\|>=\|<=\|=>\|<=>/

" temporal operators and constraints
syn keyword BCfrConstrPunctuation  U X G E containedin=CfrConstr contained
syn keyword Error						  U X G E
syn match	BCfrLeakingPunctuation /\m-->\|==>\|##>/ containedin=CfrConstr 

" keywords in constraints
syn keyword CfrConstrKeywords		in opt ref parent children root containedin=CfrConstr contained
syn keyword CfrConstrKeywords		all lone no not disj one some containedin=CfrConstr contained
syn keyword BCfrConstrKeywords	finally initially else this containedin=CfrConstr contained
syn keyword Error 					in opt ref parent children root this all 
syn keyword Error						lone no not disj one some else 
syn keyword Error 					finally initially 
" FIXME: add property patterns

" constraints, try to highlight unpaired closing 
syn match Error /\m\]/ containedin=CfrConstr
syn match Error /\m\]->\|\]=>\|\]#>/ containedin=CfrConstr

" constraints, try to highlight nested openings
syn match Error /\m\[\|-\[\|=\[\|#\[/ containedin=CfrConstr contained

" constraints
syn region CfrConstr matchGroup=CfrTopLevelPunctuation
\	start=/\m\[/ 	end=/\m\]/	keepend
syn region CfrConstr matchGroup=CfrTopLevelPunctuation
\	start=/\m\[/ 	end=/\m\]/	contains=@CfrComment

" guarded transitions (transition constraints)
syn region CfrConstr matchGroup=CfrTopLevelPunctuation
\	start=/-\[/	end=/\]->/	contains=@CfrConstrCluster keepend
syn region CfrConstr matchGroup=CfrTopLevelPunctuation
\	start=/-\[/	end=/\]->/	contains=@CfrComment 

syn region CfrConstr matchGroup=CfrTopLevelPunctuation
\	start=/=\[/	end=/\]=>/	contains=@CfrConstrCluster keepend
syn region CfrConstr matchGroup=CfrTopLevelPunctuation
\	start=/=\[/	end=/\]=>/	contains=@CfrComment

syn region CfrConstr matchGroup=CfrTopLevelPunctuation
\	start=/#\[/	end=/\]#>/	contains=@CfrConstrCluster keepend
syn region CfrConstr matchGroup=CfrTopLevelPunctuation
\	start=/#\[/	end=/\]#>/	contains=@CfrComment

" comments
syn region	CfrLineComment		start="\m//" end="$" oneline
syn region	CfrBlockComment	start="\m/\*" end="\m\*/" contains=CfrBlockComment
syn cluster CfrComment 			add=CfrLineComment,CfrBlockComment

syn keyword Todo TODO FIXME containedin=CfrLineComment,CfrBlockComment contained




" select color groups
hi link CfrKeyword		Keyword
hi link BCfrKeyword		Keyword

hi link CfrLineComment	Comment
hi link CfrBlockComment	Comment
hi link CfrString			String

" using Normal warrants that the models are not too flashy; there
" is not much besides identifiers in these models ...
hi link CfrIdentifier	Normal
hi link CfrNumber			Number
hi link CfrType			Type

hi link CfrCardinality 	StorageClass

" as we use Normal for identifiers, we risk using 
" this color for another frequent element
hi link CfrTopLevelPunctuation	Identifier
hi link CfrConstrPunctuation		Operator
hi link BCfrConstrPunctuation		CfrConstrPunctuation
hi link CfrLeakingPunctuation		CfrConstrPunctuation
hi link BCfrLeakingPunctuation	CfrConstrPunctuation
hi link BCfrPunctuation				CfrConstrPunctuation

hi link CfrConstrKeywords	Keyword
hi link BCfrConstrKeywords	CfrConstrKeywords

" constraints should not be highlighted; just their boundaries.
" the interior has its own groups
hi link CfrConstr 		Ignore

let b:current_syntax = "clafer"

"vim:ts=4
