return {

    {
        -- No explicit name: telescope.lua also depends on this same repo
        -- via a bare string, which lazy resolves to the default name
        -- "plenary.nvim" - naming this fragment "plenary" instead made
        -- lazy treat them as two unrelated plugins, installing and
        -- tracking the same repo twice under different directories.
        -- Confirmed live (both lazy/plenary and lazy/plenary.nvim existed).
        "nvim-lua/plenary.nvim",
        -- Pure Lua, nothing to build - without this lazy tries a
        -- luarocks/hererocks build every round, which always reports
        -- failure (no working luarocks here) and never clears, so
        -- `:Lazy sync` retries it until it hits lazy's 5-round safety cap
        -- and errors "Too many rounds of missing plugins". Confirmed live.
        build = false,
    },
}
