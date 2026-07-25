-- IME off when nomarl mode at MacOS(need im-select)
if vim.fn.has("mac") == 1 and vim.fn.executable("im-select") == 1 then
  vim.api.nvim_create_autocmd("InsertLeave", {
    group = vim.api.nvim_create_augroup("ime_off", { clear = true }),
    pattern = "*",
    callback = function()
      vim.fn.system("im-select com.apple.keylayout.ABC")
    end,
  })
end

-- wrap in text filetypes and no-speling
vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
