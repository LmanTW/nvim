local M = {
  options = { nowait = true, silent = true }
}

--- Setup the keymaps.
function M.setup()
  --- Navigating.
  vim.keymap.set({'n', 'v'}, '<D-Left>', '0', M.options)
  vim.keymap.set('i', '<D-Left>', '<ESC>0i', M.options)
  vim.keymap.set({'n', 'v'}, '<D-Right>', '$', M.options)
  vim.keymap.set('i', '<D-Right>', '<ESC>$a', M.options)
  vim.keymap.set({'n', 'v'}, '<S-Up>', 'gg', M.options)
  vim.keymap.set('i', '<S-Up>', '<ESC>ggi', M.options)
  vim.keymap.set({'n', 'v'}, '<S-Down>', 'G', M.options)
  vim.keymap.set('i', '<S-Down>', '<ESC>Gi', M.options)

  vim.keymap.set({'n', 'v'}, '<D-Up>', '<C-u>', M.options)
  vim.keymap.set('i', '<D-Up>', '<ESC><C-u>i', M.options)
  vim.keymap.set({'n', 'v'}, '<D-Down>', '<C-d>', M.options)
  vim.keymap.set('i', '<D-Down>', '<ESC><C-d>i', M.options)

  vim.keymap.set({'n', 'i', 'v'}, '<C-d>', vim.lsp.buf.definition, M.options)
  vim.keymap.set({'n', 'i', 'v'}, '<C-D-Left>', function() vim.diagnostic.jump({ count = -1 }) end, M.options)
  vim.keymap.set({'n', 'i', 'v'}, '<C-D-Right>', function() vim.diagnostic.jump({ count = 1 }) end, M.options)

  vim.keymap.set({'n', 'i', 'v'}, '<C-x>', '<ESC><Right>ni', M.options)

  --- Editing.
  vim.keymap.set('n', '<C-e>', 'i', M.options)
  vim.keymap.set('v', '<C-e>', '<ESC>i', M.options)

  vim.keymap.set({'n', 'v'}, '<D-x>', 'd0')
  vim.keymap.set('i', '<D-x>', '<C-u>')
  vim.keymap.set({'n', 'v'}, '<D-d>', 'diw', M.options)
  vim.keymap.set('i', '<D-d>', '<ESC>diwi', M.options)
  vim.keymap.set('v', 'a', ':\'<,\'>norm! 1i', M.options)
  vim.keymap.set('v', 'r', ':\'<,\'>norm! x<CR>gv', M.options)
  vim.keymap.set({'n', 'v'}, '<C-S-Up>', ':m .-2<CR>==')
  vim.keymap.set('i', '<C-S-Up>', '<ESC>:m .-2<CR>==a')
  vim.keymap.set({'n', 'v'}, '<C-S-Down>', ':m .+1<CR>==')
  vim.keymap.set('i', '<C-S-Down>', '<ESC>:m .+1<CR>==a')

  vim.keymap.set({'n', 'v'}, '<D-z>', 'u', M.options)
  vim.keymap.set('i', '<D-z>', '<ESC>ui', M.options)
  vim.keymap.set({'v'}, 'y', '"*ygv', M.options)
  vim.keymap.set({'n', 'v'}, 'p', '"*p', M.options)

  vim.keymap.set({'n', 'v'}, '<C-w>', ':w<CR>', M.options)
  vim.keymap.set('i', '<C-w>', '<ESC>:w<CR>a', M.options)

  --- Selecting.
  vim.keymap.set('n', '<S-Left>', 'v', M.options)
  vim.keymap.set('i', '<S-Left>', '<ESC>v', M.options)
  vim.keymap.set('n', '<S-Right>', 'v', M.options)
  vim.keymap.set('i', '<S-Right>', '<ESC><Right>v', M.options)
  vim.keymap.set({'n', 'i', 'v'}, '<D-s>', '<ESC>viw', M.options)

  --- Terminal.
  vim.keymap.set('t', '<ESC>', '<C-\\><C-n>', M.options)

  --- Exit
  vim.keymap.set('n', '<C-c>', ':q!<CR>', M.options)
  vim.keymap.set({'i', 'v'}, '<C-c>', '<ESC>', M.options)
end

return M
