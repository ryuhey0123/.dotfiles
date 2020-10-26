" Vim syntax file
" Language: Midas MGT File
" Maintainer: Ryuhei Fujita

syntax match Comment ";.*$" display
syntax match Function "\*[A-Za-z- ]*" display

syntax match Number "[+=-]" display
syntax match Number "\<\d*to\d*\>" display
syntax match Number "\<\d*to\d*by\d*\>" display

syntax match Number "\<\d\>" display
syntax match Number "\<[1-9]\d\+\>" display
syntax match Number "\<\d\+[jJ]\>" display
syntax match Float "\.\d\+\%([eE][+-]\=\d\+\)\=[jJ]\=\>" display
syntax match Float "\<\d\+[eE][+-]\=\d\+[jJ]\=\>" display
syntax match Float "\<\d\+\.\d*\%([eE][+-]\=\d\+\)\=[jJ]\=" display

syntax match Label "\<[01]\{6}\>" display

syntax keyword Boolean YES NO
syntax keyword Boolean UNCHANGED AUTO

syntax keyword Type BEAM PLSTRS TRUSS
syntax keyword Type STEEL CONC USER

syntax keyword Label FLOOR 
syntax keyword Label ACTIVE
syntax keyword Label CBS ST SM THRSEV PO THNS ULAT

syntax keyword Keyword SEL BGC LOAD

let b:current_syntax = "midasMGT"

