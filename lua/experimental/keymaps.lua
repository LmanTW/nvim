local M = {}

--- Set Keymap
--- @param modes string[]
--- @param lhs string
--- @param rhs string
--- @param insert_after? string
--- @return nil
function M.set_keymap(modes, lhs, rhs, insert_after)
  for i = 1, #modes do
    if modes[i] == 'i' then
      vim.keymap.set('i', lhs, table.concat({'<ESC>', rhs, insert_after == nil and '' or insert_after}))
    else
      vim.keymap.set(modes[i], lhs, rhs)
    end
  end
end

--- Setup The Keymap
--- @return nil
function M.setup()
  --- Navigation
  M.set_keymap({'n', 'i', 'v'}, '<D-Left>', '0', 'i')
  M.set_keymap({'n', 'i', 'v'}, '<D-Right>', '$', 'i<Right>')
  M.set_keymap({'n', 'i', 'v'}, '<S-Up>', 'gg', 'i')
  M.set_keymap({'n', 'i', 'v'}, '<S-Down>', 'G', 'i')

  --- Editing
  M.set_keymap({'n', 'v'}, '<D-x>', 'i<C-u><ESC>')
  vim.keymap.set('i', '<D-x>', '<C-u>')
  M.set_keymap({'n', 'i', 'v'}, '<D-d>', 'diw', 'i')
  M.set_keymap({'n', 'i', 'v'}, '<C-S-Up>', ':m .-2<CR>==', 'i')
  M.set_keymap({'n', 'i', 'v'}, '<C-S-Down>', ':m .+1<CR>==', '')

  M.set_keymap({'n', 'i', 'v'}, '<D-z>', '<Undo>', 'i<Right>')
  M.set_keymap({'v'}, 'y', '"*ygv')
  M.set_keymap({'n', 'v'}, 'p', '"*pi')

  M.set_keymap({'v'}, 'a', '<ESC>:\'<,\'>norm! 0i')
  M.set_keymap({'v'}, 'r', '<ESC>:\'<,\'>norm! x<CR>gv')

  --- Selecting
  M.set_keymap({'n', 'i'}, '<S-Left>', '<ESC>v')
  M.set_keymap({'n', 'i'}, '<S-Right>', '<ESC><Right>v')

  --- Other
  M.set_keymap({'n', 'i', 'v'}, '<C-w>', ':w!<CR>', 'i<Right>')
  M.set_keymap({'n'}, '<C-c>', ':q!<CR>')
  M.set_keymap({'i', 'v'}, '<C-c>', '<ESC>')

  M.set_keymap({'n', 'i', 'v'}, '<C-e>', '<ESC>i')
  M.set_keymap({'n', 'i', 'v'}, '<C-v>', 'v')
end

return M
