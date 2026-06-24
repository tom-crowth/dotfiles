vim.keymap.set("n", "<leader>db", "<cmd>Trouble<CR>", { buffer = 0 })

local function setup_lsp_diags()
    vim.diagnostic.config({
        update_in_insert = true,
        underline = true,
        signs = true,
        virtual_text = true,
    })
end

setup_lsp_diags()
