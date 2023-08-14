vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- packer it self
    use 'wbthomason/packer.nvim'
    -- Colorsceme
    use 'navarasu/onedark.nvim'
    -- statusline
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    -- commentary
    use 'tpope/vim-commentary'
    -- treesitter
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use 'nvim-treesitter/playground'
    use 'theprimeagen/harpoon'
    use 'mbbill/undotree'
    -- fuzzy finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    -- LSP
    use 'hrsh7th/nvim-compe'
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }
    use 'tpope/vim-repeat'
    -- replace with registers
    use 'vim-scripts/ReplaceWithRegister'
    -- vim git integration
    use 'tpope/vim-fugitive'
    -- copilot
    use 'github/copilot.vim'
    -- latex
    use 'lervag/vimtex'
    -- discord rich presence
    use 'andweeb/presence.nvim'
    -- sudo for nvim
    use 'lambdalisue/suda.vim'
    -- nice to have
    use 'tpope/vim-surround'
    -- transparent background
    use 'xiyaowong/nvim-transparent'
    -- css colors
    use 'ap/vim-css-color'
    -- autopairs
    use 'LunarWatcher/auto-pairs'
end)
