return {
    "nvim-treesitter/nvim-treesitter",
    -- main (upstream's default branch, previously pinned to master to
    -- keep the old API working - see git log) is a full, intentionally
    -- incompatible rewrite; upstream's own README says to treat it as a
    -- different plugin. There's no more setup()-config-table module
    -- system (autotag included): parsers install imperatively via
    -- .install(), and highlighting/indent are themselves plain Neovim
    -- core features (:h treesitter-highlight, :h treesitter-indent) that
    -- this plugin only supplies queries/indentexpr for - turned on
    -- per-buffer below instead of a config flag. Also requires the
    -- tree-sitter-cli binary on PATH now (home/programs/nvim.nix) and
    -- doesn't support lazy-loading at all (upstream's own example spec
    -- sets lazy = false).
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    dependencies = {
        -- Autotag dropped its own nvim-treesitter module registration for
        -- the same reason - now a plain standalone setup() call, only
        -- needing an active parser at edit time, same as this file's own
        -- FileType autocmd relies on below.
        { "windwp/nvim-ts-autotag", opts = {} },
    },
    config = function()
        require("nvim-treesitter").install({
            "lua",
            "vim",
            "vimdoc",
            "bash",
            "yaml",
            "json",
            "dockerfile",
            "gitignore",
            "html",
            "css",
            "javascript",
            "typescript",
            "tsx",
            "jsdoc",
            "graphql",
            "c",
            "rust",
            "python",
        })

        -- pcall guards both: a filetype with no installed (or no
        -- available) parser should just fall back to Neovim's ordinary
        -- syntax highlighting/indenting, not error on every buffer opened.
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "*",
            callback = function()
                if pcall(vim.treesitter.start) then
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end,
        })
    end
}
