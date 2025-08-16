-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use {
        'wbthomason/packer.nvim',
        commit = 'ea0cc3c',
    }

    -- Theming
    use {
        'rose-pine/neovim',
        as = 'rose-pine',
        tag = 'v3.0.1',
        config = function() vim.cmd('colorscheme rose-pine') end,
    }

    -- Navigation
    use { 'theprimeagen/harpoon', commit = '1bc17e3' }
    use { 'nvim-treesitter/nvim-treesitter', tag = 'v0.9.3' }
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        requires = {
            { 'nvim-lua/plenary.nvim', commit = 'b9fd522' },
        },
    }

    -- LSP Support
    use { 'neovim/nvim-lspconfig', tag = 'v2.4.0' }
    use { 'mason-org/mason.nvim', tag = 'v2.0.1' }
    use { 'mason-org/mason-lspconfig.nvim', tag = 'v2.1.0' }
    use { "stevearc/conform.nvim", tag = 'v9.0.0' }

    -- Autocompletion
    use { 'hrsh7th/nvim-cmp', commit = 'b5311ab' }
    use { 'hrsh7th/cmp-nvim-lsp', commit = 'a8912b8' }
    use { "L3MON4D3/LuaSnip", tag = "v2.4.0" }

    -- Utilities
    use { 'mbbill/undotree', tag = 'rel_6.1' }
    use { 'tpope/vim-commentary', commit = '64a654e' }
end)
