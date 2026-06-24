return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        --config = function()
        --    vim.cmd({TSUpdate})
        --end,
        build = ':TSUpdate',
    },
}
