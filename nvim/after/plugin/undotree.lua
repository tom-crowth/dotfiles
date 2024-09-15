vim.cmd([[
    let g:undotree_WindowLayout = 3
    let g:undotree_ShortIndicators = 1
    let g:undotree_SplitWidth = 36
    let g:undotree_SetFocusWhenToggle = 1

    ]]
)
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
