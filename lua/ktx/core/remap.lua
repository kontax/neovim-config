vim.g.mapleader = ","

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open netrw" } )
vim.keymap.set("n", "<leader><space>", ":nohlsearch<CR>", { noremap = true, silent = true, desc = "Clear search highlights" } )

-- Window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" } )
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" } )
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" } )
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" } )

-- Buffer management
vim.keymap.set("n", "<leader>b", ":ls<CR>:b<space>", { desc = "List open buffers" } )
vim.keymap.set("n", "<PageUp>", ":bprevious<CR>", { desc = "Switch to previous buffer" } )
vim.keymap.set("n", "<PageDown>", ":bnext<CR>", { desc = "Switch to next buffer" } )
