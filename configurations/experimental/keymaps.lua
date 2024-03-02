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

-- Editing 

setKeymap({'n', 'i', 'v'}, '<S-C-Up>', ':m .-2<CR>==')
setKeymap({'n', 'i', 'v'}, '<S-C-Down>', ':m .+1<CR>==')
setKeymap({'n', 'i', 'v'}, '<D-x>', '<C-u>', false)
setKeymap({'n', 'i'}, '<D-d>', 'diw')

setKeymap({'n', 'i', 'v'}, '<D-z>', '<Undo>', nil, '<Right>')
setKeymap({'n', 'v'}, 'y', '"*ygv')
setKeymap({'n', 'v'}, 'p', '"*p')

setKeymap({'n', 'i'}, '<C-w>', ':w<CR>', nil, '<Right>')

-- Select

setKeymap({'n', 'i'}, '<S-Left>', '<ESC>v', false)
setKeymap({'n', 'i'}, '<S-Right>', '<ESC><Right>v', false)

-- Open Plugins

setKeymap({'n', 'i', 'v'}, '<C-f>', ':NvimTreeFocus<CR>')
setKeymap({'n', 'i', 'v'}, '<C-g>', ':Telescope find_files<CR>')
setKeymap({'n', 'i', 'v'}, '<C-r>', ':RunFile toggleterm<CR>')
setKeymap({'n', 'i', 'v'}, '<C-m>', ':RunFile toggleterm<CR>')

vim.keymap.set('n', '<C-v>', require("lsp_lines").toggle)
vim.keymap.set('i', '<C-v>', require("lsp_lines").toggle)
vim.keymap.set('v', '<C-v>', require("lsp_lines").toggle)

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

local mappings = {}

mappings['<D-Up>'] = {'scroll', {'-vim.wo.scroll', 'true', '500', [['circular']]}}
mappings['<D-Down>'] = {'scroll', { 'vim.wo.scroll', 'true', '500', [['circular']]}}

require('neoscroll.config').set_mappings(mappings)
