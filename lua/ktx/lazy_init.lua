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

-- Default lockfile lives at stdpath("config") .. "/lazy-lock.json" - under
-- Nix/home-manager, ~/.config/nvim is a read-only vendored copy (each file
-- is a symlink into the Nix store), so lazy can't write its own lock
-- updates there. stdpath("data") is a real, writable directory regardless
-- of how the config itself got installed - but on a fresh machine (or a
-- wiped data dir) it starts out empty, and pointing lazy at it outright
-- would mean the git-tracked lockfile's pinned commits (this file, meant
-- to make installs reproducible) never get read at all: lazy would just
-- grab whatever's newest upstream for every plugin instead. Confirmed this
-- is exactly what happened testing in a clean sandbox - mason-lspconfig.nvim
-- came in several months ahead of the pinned commit, on a version that had
-- since dropped the API this config was written against. Seed the writable
-- copy from the tracked one on first run so a fresh install still restores
-- the pinned versions; lazy writes updates to the writable copy from then on.
local writable_lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json"
local vendored_lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json"
if not vim.loop.fs_stat(writable_lockfile) and vim.loop.fs_stat(vendored_lockfile) then
    -- `cp` preserves the source file's mode bits, so the "writable" copy
    -- came out read-only too (confirmed live: lazy's own :Lazy update
    -- failed with "Permission denied" writing straight back to the copy
    -- this had just created). Read/write through Lua instead - a file
    -- opened for "w" gets ordinary (umask-default, writable) permissions
    -- regardless of the source's.
    local src = assert(io.open(vendored_lockfile, "r"))
    local contents = src:read("*a")
    src:close()
    local dst = assert(io.open(writable_lockfile, "w"))
    dst:write(contents)
    dst:close()
end

require("lazy").setup({
    { import = "ktx.plugins" },
    { import = "ktx.plugins.lsp" }
},{
    lockfile = writable_lockfile,
    checker = { enabled = true, notify = false },
    change_detection = { notify = false },
    install = { colorscheme = {'gruvbox'} },
})
