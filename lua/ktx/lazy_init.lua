local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { import = "ktx.plugins" },
    { import = "ktx.plugins.lsp" }
},{
    -- Default lockfile lives at stdpath("config") .. "/lazy-lock.json" -
    -- under Nix/home-manager, ~/.config/nvim is a read-only vendored copy
    -- (each file is a symlink into the Nix store), so lazy can't write its
    -- own lock updates there. stdpath("data") is a real, writable directory
    -- regardless of how the config itself got installed.
    lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json",
    checker = { enabled = true, notify = false },
    change_detection = { notify = false },
    install = { colorscheme = {'gruvbox'} },
})
