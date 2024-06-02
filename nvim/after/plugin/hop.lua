local hop = require("hop")
local directions = require("hop.hint").HintDirection

vim.keymap.set('n', 'f', function()
    hop.hint_char1({direction = directions.AFTER_CURSOR, current_line_only = true })
end, {remap=true})
vim.keymap.set('n', 'F', function()
    hop.hint_char1({direction = directions.BEFORE_CURSOR, current_line_only = true })
end, {remap=true})
vim.keymap.set('n', 't', function()
    hop.hint_char1({direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, {remap=true})
vim.keymap.set('n', 'T', function()
    hop.hint_char1({direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, {remap=true})

-- more keybindings to implement here


hop.setup {
    keys = 'fghrtyvbneudjcm',
    quit_key = "<C-c>",
    jump_on_sole_occurrence = true,
}
