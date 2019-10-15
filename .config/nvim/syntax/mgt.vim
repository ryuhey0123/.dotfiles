" Vim syntax file
" Language: Midas MGT File
" Maintainer: Ryuhei Fujita
"integer number, or floating point number without a dot.

syn region Comment start="{" end="}" contains=VectorScriptComment,VectorScriptIncludeFile,VectorScriptMacro
"
" Define the default highlighting.
if version >= 508 || !exists("did_VectorScript_syntax_inits")
  if version < 508
    let did_VectorScript_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

    HiLink VectorScriptComment		Comment
  delcommand HiLink
endif

let b:current_syntax = "VectorScript"

