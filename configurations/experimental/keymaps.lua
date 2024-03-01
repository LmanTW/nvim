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

setKeymap({'n', 'i'}, '<D-x>', '<C-u>', false)
setKeymap({'n', 'i'}, '<D-d>', 'diw')

setKeymap({'n', 'i', 'v'}, 'y', '"*ygv')
setKeymap({'n', 'i', 'v'}, 'p', '"*p')

setKeymap({'n', 'i'}, '<C-w>', ':w<CR>', nil, '<Right>')

-- Select

setKeymap({'n', 'i'}, '<S-Left>', '<ESC>v')
setKeymap({'n', 'i'}, '<S-Right>', '<ESC><Right>v')

-- Open Plugins

setKeymap({'n', 'i'}, '<C-f>', ':NvimTreeFocus<CR>')
setKeymap({'n', 'i'}, '<C-g>', ':Telescope find_files<CR>')
setKeymap({'n', 'i'}, '<C-r>', ':RunFile toggleterm<CR>')

-- Tab

setKeymap({'n', 'i'}, '<A-Left>', ':BufferPrevious<CR>')
setKeymap({'n', 'i'}, '<A-Right>', ':BufferNext<CR>')
setKeymap({'n', 'i'}, '<A-Up>', ':BufferNex<CR>:BufferPrevious<CR>')
setKeymap({'n', 'i'}, '<A-Down>', ':BufferClose<CR>')

-- Change Mode

setKeymap({'n', 'i'}, '<C-e>', 'i')
setKeymap({'n', 'i'}, '<C-v>', 'v')

setKeymap({'v'}, '<C-e>', '<ESC>i')

vim.keymap.set('n', '<C-c>', ':q!<CR>')
vim.keymap.set('i', '<C-c>', '<ESC>')
vim.keymap.set('v', '<C-c>', '<ESC>')

-- Scroll

local mappings = {}

mappings['<D-Up>'] = {'scroll', {'-vim.wo.scroll', 'true', '250', [['circular']]}}
mappings['<D-Down>'] = {'scroll', { 'vim.wo.scroll', 'true', '250', [['circular']]}}

require('neoscroll.config').set_mappings(mappings)
