return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'L3MON4D3/LuaSnip',
    },
    config = function()
        require('mason').setup({})
        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'LSP actions',
            callback = function(event)
                local opts = { buffer = event.buf, remap = false }
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
                vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=1<CR>", opts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
            end,
        })

        -- 3. Setup LSP Servers & Capabilities
        local lspconfig = require('lspconfig')
        local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

        -- Setup mason-lspconfig with the handlers directly in the setup table
        require('mason-lspconfig').setup({
            ensure_installed = { 'clangd', 'rust_analyzer', 'lua_ls' },
            handlers = {
                -- Default handler for all servers
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = lsp_capabilities,
                    })
                end,
                -- Dedicated handler for lua_ls
                ['lua_ls'] = function()
                    lspconfig.lua_ls.setup({
                        capabilities = lsp_capabilities,
                        settings = {
                            Lua = {
                                workspace = {
                                    -- Makes the server aware of Neovim runtime files
                                    library = vim.api.nvim_get_runtime_file("", true)
                                }
                            }
                        }
                    })
                end,
            }
        })

        -- Setup nvim-cmp (Autocompletion)
        local cmp = require('cmp')
        local cmp_select = { behavior = cmp.SelectBehavior.Insert }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip', keyword_length = 2 },
                { name = 'path' },
            }, {
                { name = 'buffer', keyword_length = 3 },
            }),
            mapping = cmp.mapping.preset.insert({
                ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ['<C-Space>'] = cmp.mapping.complete(),
            }),
        })
    end,
}
