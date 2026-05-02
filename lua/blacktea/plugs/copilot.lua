return {
    'github/copilot.vim',
    config = function()
        vim.g.copilot_enabled = true;

        vim.keymap.set('i', '<C-L>', '<Plug>(copilot-accept-word)')
        vim.keymap.set('i', '<C-u>', '<Plug>(copilot-next)')
        vim.keymap.set('i', '<C-i>', '<Plug>(copilot-previous)')
        -- toggle Copilot
        vim.keymap.set('n', '<leader>cp', function()
            if vim.g.copilot_enabled then
                vim.cmd('Copilot disable')
                vim.g.copilot_enabled = false
            else
                vim.cmd('Copilot enable')
                vim.g.copilot_enabled = true
            end
        end, { desc = 'Toggle Copilot' })
    end
}
