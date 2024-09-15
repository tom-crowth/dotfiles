return {
    { 'williamboman/mason.nvim',          config = true },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'j-hui/fidget.nvim',                opts = {} },
    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
    'neovim/nvim-lspconfig',

    {
        'folke/lazydev.nvim',
        ft = "lua",
        opts = {
            library = {
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
    },
    -- autocomplete
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'rafamadriz/friendly-snippets',
}
