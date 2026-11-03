local map = vim.keymap.set

map("i", "jk", "<Esc>")
map("i", "<C-c>", "<Esc>")

-- Resize window using <shift> arrow keys
map("n", "<S-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<S-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<S-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<S-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- emacs Keybindings
map({ "i", "c" }, "<C-a>", "<Home>", { desc = "Move to beginning of line" })
map({ "i", "c" }, "<C-e>", "<End>", { desc = "Move to end of line" })
map({ "i", "c" }, "<C-b>", "<Left>", { desc = "Move back" })
map({ "i", "c" }, "<C-f>", "<Right>", { desc = "Move forward" })
map({ "i", "c" }, "<C-p>", "<Up>", { desc = "Move up" })
map({ "i", "c" }, "<C-n>", "<Down>", { desc = "Move down" })
map({ "i", "c" }, "<C-d>", "<Del>", { desc = "Delete character forward" })
map({ "i", "c" }, "<C-h>", "<BS>", { desc = "Delete character backward" })
