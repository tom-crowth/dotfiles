-- Keymap to open fault filetree
vim.keymap.set("n", "<leader>ft", "<cmd>Neotree toggle=true<CR>")

local git_check = function()
    vim.cmd.Git()
    vim.cmd('rightb vnew')
    local win = vim.api.nvim_get_current_win()
    local buf = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_win_set_buf(win, buf)
    require('neo-tree.command').execute({
        source = "git_status",
        position = "current",
    })
end
vim.keymap.set("n", "<leader>gt", git_check)
