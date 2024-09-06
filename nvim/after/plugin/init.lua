-- Comment.nvim additions
local ft = require('Comment.ft')
ft.set('openscad', '//%s')

-- Probs not needed when using VimTex (already handled)
vim.cmd [[let g:tex_flavor = "latex"]]
