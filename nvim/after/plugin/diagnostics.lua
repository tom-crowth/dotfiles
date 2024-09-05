vim.keymap.set("n", "<leader>db", "<cmd>Trouble<CR>", { buffer = 0 })

local function setup_lsp_diags()
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics,
        {
            virtual_text = true,
            signs = true,
            update_in_insert = true,
            underline = true,
        }
    )
end

setup_lsp_diags()
