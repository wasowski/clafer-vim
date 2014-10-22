if exists("b:current_syntax")
  finish
endif

setlocal iskeyword+=":][>=->"

syn keyword ClaferKeyword abstract mutable xor no not some initially now mutable enum mux initial final history
syn region ClaferComment start="\/\/.*$" end="$"
syn region ClaferComment start="/\*" end="\*/"
syn match ClaferType 	"integer\|string"
syn match ClaferPunctuation "->\|\.\.\|<=>\|:\|?\|\[\|\]\|*\|=\|+\|++\|&&\|||\||"
syn match ClaferPunctuation "-->\|==>"
syn match ClaferPunctuation "##=>\|-\[\|\]->\|=\[\|\]=>\|#\[\|\]#>"

highlight link ClaferKeyword 		Keyword
highlight link BClaferKeyword 	Keyword
highlight link ClaferComment 		Comment
highlight link ClaferPunctuation Operator
highlight link ClaferType 			Type

let b:current_syntax = "clafer"
