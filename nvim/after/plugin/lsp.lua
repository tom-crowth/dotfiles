local lsp_zero = require('lsp-zero')
local cmp = require('cmp')
-- luasnip.config.setup {}

cmp.setup {
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
    },
    completion = {
        completeopt = 'menu,menuone,noinsert',
    },
    mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete,
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        --     ['<Tab>'] = cmp.mapping(function(fallback)
        --         if cmp.visible() then
        --             cmp.select_next_item()
        --         elseif luasnip.expand_or_locally_jumpable() then
        --             luasnip.expand_or_jump()
        --         else
        --             fallback()
        --         end
        --     end, { 'i', 's' }),
        --     ['<S-Tab>'] = cmp.mapping(function(fallback)
        --         if cmp.visible() then
        --             cmp.select_prev_item()
        --         elseif luasnip.locally_jumpable(-1) then
        --             luasnip.expand_or_jump()
        --         else
        --             fallback()
        --         end
        --     end, { 'i', 's' }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
    },
}

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- cmp.setup.cmdline({ ':' }, {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = {
--         cmp.config.sources({
--             { name = 'path' }
--         }, {
--             { name = 'cmdline' }
--         }),
--         matching = { disallow_symbol_nonprefix_matching = false }
--     }
-- })
--
local lsp_attach = function(client, bufnr)
    local builtin = require('telescope.builtin')
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<F2>', vim.lsp.buf.rename, 'Rename')
    nmap('<F3>', vim.lsp.buf.format, 'Format')
    nmap('<F4>', vim.buf.code_action, 'Code Action')
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

lsp_zero.extend_lspconfig({
    sign_text = true,
    lsp_attach = lsp_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
})


-- Set up for mason to install LSPs automatically
require("mason").setup({})
local mason_lspconfig = require('mason-lspconfig')

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

mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


-- define handlers for specific lsps
local pyright_handler = function()
    local lspconfig = require('lspconfig')
    lspconfig.pyright.setup {
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
end

local lua_handler = function()
    local lspconfig = require('lspconfig')
    lspconfig.lua_ls.setup {
        capabilities = capabilities,
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
            },
        },
    }
end

local gopls_handler = function()
    local lspconfig = require('lspconfig')
    lspconfig.gopls.setup {
        capabilities = capabilities,
        settings = {
            gopls = {
                analyses = {
                    unusedparams = true,
                },
                staticcheck = true,
                gofumpt = true,
            },
        },
    }
end

local marksman_handler = function()
    local lspconfig = require('lspconfig')
    lspconfig.marksman.setup {
        capabilities = capabilities,
        settings = {
        },
    }
end


local odin_handler = function()
    local lspconfig = require('lspconfig')
    lspconfig.ols.setup {
        capabilities = capabilities,
        settings = {
        },
    }
end

-- use the specific handlers and a generic
local handlers = {
    function(server_name)
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = lsp_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
        }
    end,
    ['lua_ls'] = lua_handler,
    ['pyright'] = pyright_handler,
    -- ['gopls'] = gopls_handler,
    -- ['marksman'] = marksman_handler,
    -- ['ols'] = odin_handler,
}
mason_lspconfig.setup_handlers(handlers)


require('lazydev').setup()


-- Configure lua lsp

-- lsp.setup()
