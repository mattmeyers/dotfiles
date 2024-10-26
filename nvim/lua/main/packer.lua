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
        tag = '0.1.2',
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
            { 'neovim/nvim-lspconfig' },
            {
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        },
    }

    use {
        "windwp/nvim-autopairs",
        commit = 'ee297f2',
        config = function() require("nvim-autopairs").setup {} end,
    }
end)
