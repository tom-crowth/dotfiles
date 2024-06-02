return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        --config = function()
        --    vim.cmd({TSUpdate})
        --end,
        build = ':TSUpdate',
    },
}
