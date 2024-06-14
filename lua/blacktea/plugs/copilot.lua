return {
    'github/copilot.vim',
    config = function()
        vim.keymap.set('i', '<C-L>', '<Plug>(copilot-accept-word)')
        vim.keymap.set('i', '<C-N>', '<Plug>(copilot-next)')
        vim.keymap.set('i', '<C-P>', '<Plug>(copilot-previous)')
    end
}
