local opt = vim.opt

opt.spell = false
opt.colorcolumn = "80,100"
opt.conceallevel = 0
opt.wrap = true
opt.scrolloff = 10
opt.sidescrolloff = 0

vim.diagnostic.config({
  float = {
    header = {},
    source = true,
    border = "rounded",
    wrap = true,
  },
})

vim.g.lazyvim_python_lsp = "ty"

-- LazyVimがデフォルトで追加している「起動画面非表示フラグ（I）」を削除する
vim.opt.shortmess:remove("I")
