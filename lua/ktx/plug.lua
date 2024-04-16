local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Telescope fuzzy finder
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim')

vim.call('plug#end')
