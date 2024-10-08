return {
    'ErichDonGubler/lsp_lines.nvim',
    config = function()
        vim.keymap.set( "n", "<Leader>v", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })
        require("lsp_lines").setup()
    end,
}
