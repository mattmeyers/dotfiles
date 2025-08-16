require("mason").setup()
require("mason-lspconfig").setup()

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local opts = { buffer = args.buf, remap = false }

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
        vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)

        vim.keymap.set("n", "<leader>k", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("n", "<leader>s", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, opts)

        vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = 1 }) end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = -1 }) end, opts)

        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end,
})

vim.diagnostic.enable = true
vim.diagnostic.config({ virtual_text = true })
