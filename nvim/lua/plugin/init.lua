return require'packer'.startup(function()
    use 'wbthomason/packer.nvim'
    use 'lifepillar/vim-gruvbox8'
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use 'onsails/lspkind.nvim' -- icons for lsp complete items
    use 'nvim-treesitter/nvim-treesitter'
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'tpope/vim-commentary'
    use 'tpope/vim-fugitive'

    use 'lewis6991/gitsigns.nvim'
    use 'nvim-lualine/lualine.nvim'
    use { 'akinsho/toggleterm.nvim', tag = '*' }
    use 'szw/vim-maximizer'
    use {'nvim-orgmode/orgmode', config = function()
            require('orgmode').setup{}
    end
    }

    use 'norcalli/nvim-colorizer.lua'
    use {
        "SmiteshP/nvim-gps",
        requires = "nvim-treesitter/nvim-treesitter"
    }
    use {
      'phaazon/hop.nvim',
      branch = 'v1', -- optional but strongly recommended
    }
    use 'rmehri01/onenord.nvim'
    use 'ayu-theme/ayu-vim'
    use 'tomasiser/vim-code-dark'
    -- install without yarn or npm
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
end)
