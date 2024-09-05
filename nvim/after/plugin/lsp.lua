local lsp = require('lsp-zero').preset({})

lsp.on_attach = function(_, bufnr)
    local builtin = require('telescope.builtin')
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<leader>r', vim.buf.rename, '[R]ename')
    nmap('<leader>ca', vim.buf.code_action, '[C]ode [A]ction')

    nmap('gd', builtin.lsp_definitions, '[G]oto [D]efinition')
    nmap('gr', builtin.lsp_references, '[G]oto [R]eferences')
    nmap('gI', builtin.lsp_implementations, '[G]oto [I]mplementation')
    nmap('<leader>D', builtin.lsp_type_definitions, '[T]ype [D]efinition')
    nmap('<leader>ds', builtin.lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-K>', vim.lsp.buf.signature_help, 'Signature Documentation')

    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
end

require('which-key').register {

    { "<leader>c",  group = "[C]ode" },
    { "<leader>c_", hidden = true },
    { "<leader>d",  group = "[D]ocument" },
    { "<leader>d_", hidden = true },
    { "<leader>g",  group = "[G]it" },
    { "<leader>g_", hidden = true },
    { "<leader>h",  group = "Git [H]unk" },
    { "<leader>h_", hidden = true },
    { "<leader>r",  group = "[R]ename" },
    { "<leader>r_", hidden = true },
    { "<leader>s",  group = "[S]earch" },
    { "<leader>s_", hidden = true },
    { "<leader>t",  group = "[T]oggle" },
    { "<leader>t_", hidden = true },
    { "<leader>w",  group = "[W]orkspace" },
    { "<leader>w_", hidden = true },
}

require('which-key').register({
    { "<leader>",  group = "VISUAL <leader>", mode = "v" },
    { "<leader>h", group = "Git [H]unk",      mode = "v" },
}, { mode = 'v' })

require("mason").setup()
require("mason-lspconfig").setup()

local servers = {
    pyright = {},
    rust_analyzer = {},
    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            -- toggle to reduce noisy 'missing-fields' warnings
            -- diagnostics = { disable = { 'missing-fields' } },
        },
    },
}

require('neodev').setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
        }
    end,
}

--local cmp = require 'cmp'
-- luasnip.config.setup {}

-- cmp.setup {
--     snippet = {
--         expand = function(args)
--             luasnip.lsp_expand(args.body)
--         end,
--     },
--     completion = {
--         completeopt = 'menu,menuone,noinsert',
--     },
--     mapping = cmp.mapping.preset.insert {
--         ['<C-n>'] = cmp.mapping.select_next_item(),
--         ['<C-p>'] = cmp.mapping.select_prev_item(),
--         ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--         ['<C-f>'] = cmp.mapping.scroll_docs(4),
--         ['<C-Space>'] = cmp.mapping.complete {},
--         ['<CR>'] = cmp.mapping.confirm {
--             behavior = cmp.ConfirmBehavior.Replace,
--             select = true,
--         },
--         ['<Tab>'] = cmp.mapping(function(fallback)
--             if cmp.visible() then
--                 cmp.select_next_item()
--             elseif luasnip.expand_or_locally_jumpable() then
--                 luasnip.expand_or_jump()
--             else
--                 fallback()
--             end
--         end, { 'i', 's' }),
--         ['<S-Tab>'] = cmp.mapping(function(fallback)
--             if cmp.visible() then
--                 cmp.select_prev_item()
--             elseif luasnip.locally_jumpable(-1) then
--                 luasnip.expand_or_jump()
--             else
--                 fallback()
--             end
--         end, { 'i', 's' }),
--     },
--     sources = {
--         { name = 'nvim_lsp' },
--         { name = 'luasnip' },
--         { name = 'path' },
--     },
-- }



-- Configure python language server for neovim
require('lspconfig').pyright.setup {
    capabilities = capabilities,
    on_attach = function()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
        vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<CR>", { buffer = 0 })
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = 0 })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = 0 })
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = 0 })
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { buffer = 0 })
    end,
}

lsp.setup()
