-- Set Keymap
local function setKeymap (modes, lhs, rhs, insertSpecial, extra)
  for _, name in pairs(modes) do
    if name == 'i' and insertSpecial ~= false then
      if extra == nil then
        vim.keymap.set('i', lhs, '<ESC>' .. rhs .. 'i')
      else
        vim.keymap.set('i', lhs, '<ESC>' .. rhs .. 'i' .. extra)
      end
    else
      vim.keymap.set(name, lhs, rhs)
    end
  end
end

-- Navigation

setKeymap({'n', 'i', 'v'}, '<D-Left>', '0')
setKeymap({'n', 'i', 'v'}, '<D-Right>', '$', nil, '<Right>')
setKeymap({'n', 'i', 'v'}, '<S-Up>', 'gg')
setKeymap({'n', 'i', 'v'}, '<S-Down>', 'G')
setKeymap({'n', 'i', 'v'}, '<C-b>', '<ESC>``', 'i')

-- Editing 

setKeymap({'n', 'i', 'v'}, '<S-C-Up>', ':m .-2<CR>==')
setKeymap({'n', 'i', 'v'}, '<S-C-Down>', ':m .+1<CR>==')
setKeymap({'n', 'i', 'v'}, '<D-x>', '<C-u>', false)
setKeymap({'n', 'i', 'v'}, '<D-s>', 'viw')
setKeymap({'n', 'i', 'v'}, '<D-d>', 'diw')

setKeymap({'n', 'i', 'v'}, '<D-z>', '<Undo>', nil, '<Right>')
setKeymap({'v'}, 'y', '"*ygv')
setKeymap({'n', 'v'}, 'p', '"*p')

setKeymap({'v'}, 'a', '<ESC>:\'<,\'>norm! 0i')
setKeymap({'v'}, 'r', '<ESC>:\'<,\'>norm! x<CR>gv')

setKeymap({'n', 'i'}, '<C-w>', ':w!<CR>', nil, '<Right>')

-- Select

setKeymap({'n', 'i'}, '<S-Left>', '<ESC>v', false)
setKeymap({'n', 'i'}, '<S-Right>', '<ESC><Right>v', false)

-- Open Plugins

setKeymap({'n', 'i', 'v'}, '<C-f>', ':NvimTreeFocus<CR>')
setKeymap({'n', 'i', 'v'}, '<C-g>', ':Telescope find_files<CR>')
setKeymap({'n', 'i', 'v'}, '<C-r>', ':RunFile toggleterm<CR>')

setKeymap({'n', 'i', 'v'}, '<C-z>', ':lua require(\'lsp_lines\').toggle()<CR>')
setKeymap({'n', 'i', 'v'}, '<C-x>', ':lua vim.diagnostic.goto_next({})<CR>')
setKeymap({'n', 'i', 'v'}, '<C-d>', ':lua vim.lsp.buf.definition()<CR>')

-- Tab

setKeymap({'n', 'i', 'v'}, '<A-Left>', ':BufferPrevious<CR>')
setKeymap({'n', 'i', 'v'}, '<A-Right>', ':BufferNext<CR>')
setKeymap({'n', 'i', 'v'}, '<A-Up>', ':BufferNex<CR>:BufferPrevious<CR>')
setKeymap({'n', 'i', 'v'}, '“', ':BufferMovePrevious<CR>')
setKeymap({'n', 'i', 'v'}, '‘', ':BufferMoveNext<CR>')
setKeymap({'n', 'i', 'v'}, '<A-Down>', ':BufferClose<CR>')

-- Change Mode

setKeymap({'n', 'i'}, '<C-e>', 'i')
setKeymap({'n', 'i'}, '<C-v>', 'v')

setKeymap({'v'}, '<C-e>', '<ESC>i')

vim.keymap.set('n', '<C-c>', ':q!<CR>')
vim.keymap.set('i', '<C-c>', '<ESC>')
vim.keymap.set('v', '<C-c>', '<ESC>')

-- Scroll

setKeymap({'i'}, '<D-Up>', '<ESC>', false)
setKeymap({'i'}, '<D-Down>', '<ESC>', false)

local neoscroll = require('neoscroll')

vim.keymap.set({'n', 'i', 'v'}, '<D-Up>', function () neoscroll.scroll(-vim.wo.scroll, { move_cursor = true, duration = 500, easing = 'circular' }) end)
vim.keymap.set({'n', 'i', 'v'}, '<D-Down>', function () neoscroll.scroll(vim.wo.scroll, { move_cursor = true, duration = 500, easing = 'circular' }) end)
