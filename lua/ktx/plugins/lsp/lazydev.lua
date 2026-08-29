return {
    'folke/neodev.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        require("neodev").setup()
    end
}
