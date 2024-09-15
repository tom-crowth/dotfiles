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
            vim.g.vimtex_view_method = "zathura"
        end
    },

    "nvim-treesitter/playground",
    "mbbill/undotree",
    "tpope/vim-fugitive",
    "tpope/vim-rhubarb",
    "tpope/vim-sleuth",
    'tpope/vim-surround',
    'tpope/vim-unimpaired',

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

    require 'other_setup.debug',
    require 'other_setup.autoformat',
}
