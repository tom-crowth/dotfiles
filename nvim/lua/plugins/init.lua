return {
    {
        "nvim-telescope/telescope.nvim",
        branch = '0.1.x',
        dependencies = {

            "nvim-lua/plenary.nvim",
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
            'BurntSushi/ripgrep',
            'sharkdp/fd',

        },
    },

    {
        "lervag/vimtex",
        lazy = false,
        init = function()
            vim.g.vimtext_viw_method = "zathura"
        end
    },

    "nvim-treesitter/playground",
    "mbbill/undotree",
    "tpope/vim-fugitive",
    "tpope/vim-rhubarb",
    "tpope/vim-sleuth",
    'tpope/vim-surround',

    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim',          config = true },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'j-hui/fidget.nvim',                opts = {} },
            'folke/neodev.nvim'
        },
    },

    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-path',
            'rafamadriz/friendly-snippets',
        }
    },

    {
        'folke/which-key.nvim',
        dependencies = { "echasnovski/mini.nvim" },
        opts = {}
    },

    {
        'navarasu/onedark.nvim',
        priority = 1000,
        config = function()
            vim.cmd.colorscheme 'onedark'
        end,
    },

    {
        'nvim-lualine/lualine.nvim',
        opts = {
            options = {
                icons_enables = true,
                theme = 'onedark',
                component_separators = '|',
                section_separators = '',
            },
        },
    },


    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        commit = "29be0919b91fb59eca9e90690d76014233392bef",
        opts = {},
    },

    { 'numToStr/Comment.nvim', opts = {} },

    require 'plugins.kickstart.debug',
    require 'plugins.kickstart.autoformat',
}
