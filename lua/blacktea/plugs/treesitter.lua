return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'nvim-treesitter/playground'},
    build = ':TSUpdate',
    config = function()
        local configs = require('nvim-treesitter.configs')
        configs.setup {
            ensure_installed = {"c", "lua", "cpp", "rust"}, 
            sync_install = true,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
                disable = {"latex"},
            },
        }
    end,
}
