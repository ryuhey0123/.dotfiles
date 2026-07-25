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
