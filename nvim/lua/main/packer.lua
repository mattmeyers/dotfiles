-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use {
        'wbthomason/packer.nvim',
        commit = 'ea0cc3c',
    }

    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        requires = { { 'nvim-lua/plenary.nvim' } },
    }

    use {
        'rose-pine/neovim',
        as = 'rose-pine',
        tag = 'v3.0.1',
        config = function() vim.cmd('colorscheme rose-pine') end,
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        tag = 'v0.9.3',
    }

    use {
        'theprimeagen/harpoon',
        commit = '1bc17e3',
    }

    use {
        'mbbill/undotree',
        tag = 'rel_6.1',
    }

    use {
        'tpope/vim-commentary',
        commit = '64a654e',
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig', commit = 'b0caeef' },
            {
                'williamboman/mason.nvim',
                commit = '7dc4facc',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim', commit = '7f0bf63' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp', commit = 'b5311ab' },
            { 'hrsh7th/cmp-nvim-lsp', commit = 'a8912b8' },
        },
    }

    use {
        "stevearc/conform.nvim",
        tag = 'v9.0.0',
    }
end)
