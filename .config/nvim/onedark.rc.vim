" onedark color options

let g:onedark_terminal_italics = 1

if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("autocmd"))
  augroup colorextend
    autocmd!
    autocmd ColorScheme * call onedark#extend_highlight("Function", { "gui": "bold" })
    autocmd ColorScheme * call onedark#extend_highlight("Folded", { "bg": { "gui": "#1C1C1C", "cterm": 234 } })
    autocmd ColorScheme * call onedark#extend_highlight("Normal", { "bg": { "gui": "NONE", "cterm": "NONE" } })
    autocmd ColorScheme * call onedark#extend_highlight("ColorColumn", { "bg": { "gui": "#121212", "cterm": 233 } })
  augroup END
endif

set background=dark
colorscheme onedark

