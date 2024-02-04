-- Normal Mode Action
vim.keymap.set('n', '<D-Left>', '0<Left>')
vim.keymap.set('n', '<D-Right>', '$<Right>')
vim.keymap.set('n', '<D-x>', '<C-u>')
vim.keymap.set('n', '<D-d>', 'diw')
vim.keymap.set('n', '<S-Up>', 'gg')
vim.keymap.set('n', '<S-Down>', '<ESC>G')
vim.keymap.set('n', '<S-C-Up>', ':m .-2<CR>==<ESC>')
vim.keymap.set('n', '<S-C-Down>', ':m .+1<CR>==<ESC>')
vim.keymap.set('n', 'p', '"*p')

vim.keymap.set('n', '<C-w>', ':w<CR>')
vim.keymap.set('n', '<C-r>', ':RunFile toggleterm<CR>')
vim.keymap.set('n', '<C-c>', ':q!<CR>')

vim.keymap.set('n', '<C-f>', ':NvimTreeFocus<CR>')
vim.keymap.set('n', '<C-g>', ':Telescope find_files<CR>')
vim.keymap.set('n', '<A-Left>', ':BufferPrevious<CR>')
vim.keymap.set('n', '<A-Right>', ':BufferNext<CR>')
vim.keymap.set('n', '“', ':BufferMovePrevious<CR>')
vim.keymap.set('n', '‘', ':BufferMoveNext<CR>')
vim.keymap.set('n', '<A-Up>', ':BufferNex<CR>:BufferPrevious<CR>')
vim.keymap.set('n', '<A-Down>', ':BufferClose<CR>')

vim.keymap.set('n', '<C-e>', 'i') -- Change Mode
vim.keymap.set('n', '<C-v>', 'v') -- Change Mode

-- Insert Mode Action
vim.keymap.set('i', '<D-Left>', '<ESC>0i<Left>')
vim.keymap.set('i', '<D-Right>', '<ESC>$i<Right>')
vim.keymap.set('i', '<D-Up>', '<ESC>')
vim.keymap.set('i', '<D-Down>', '<ESC>')
vim.keymap.set('i', '<D-z>', '<ESC><Undo>i<Right>')
vim.keymap.set('i', '<D-x>', '<C-u>')
vim.keymap.set('i', '<D-d>', '<ESC>diwi')
vim.keymap.set('i', '<S-Left>', '<ESC>v')
vim.keymap.set('i', '<S-Right>', '<Right><ESC>v')
vim.keymap.set('i', '<S-Up>', '<ESC>ggi')
vim.keymap.set('i', '<S-Down>', '<ESC><ESC>Gi')
vim.keymap.set('i', '<S-C-Up>', '<ESC>:m .-2<CR>==<ESC>i')
vim.keymap.set('i', '<S-C-Down>', '<ESC>:m .+1<CR>==<ESC>i')

vim.keymap.set('i', '<C-w>', '<ESC>:w<CR>i<Right>')
vim.keymap.set('i', '<C-r>', '<ESC>:RunFile toggleterm<CR>')

vim.keymap.set('i', '<C-f>', '<ESC>:NvimTreeFocus<CR>')
vim.keymap.set('i', '<C-g>', '<ESC>:Telescope find_files<CR>')
vim.keymap.set('i', '<A-Left>', '<Esc>:BufferPrevious<CR>i')
vim.keymap.set('i', '<A-Right>', '<Esc>:BufferNext<CR>i')
vim.keymap.set('i', '“', '<ESC>:BufferMovePrevious<CR>i')
vim.keymap.set('i', '‘', '<ESC>:BufferMoveNext<CR>i')
vim.keymap.set('i', '<A-Up>', '<ESC>:BufferNext<CR>:BufferPrevious<CR>i')
vim.keymap.set('i', '<A-Down>', '<ESC>:BufferClose<CR>i')

vim.keymap.set('i', '<C-c>', '<ESC>') -- Change Mode
vim.keymap.set('i', '<C-v>', '<ESC>v') -- Change Mode

-- Visual Mode

vim.keymap.set('v', '<D-Left>', '0<Left>')
vim.keymap.set('v', '<D-Right>', '$<Right>')
vim.keymap.set('v', 'y', '"*ygv')
vim.keymap.set('v', 'p', '"*p')

vim.keymap.set('v', '<C-w>', '<ESC>:w<CR>v')
vim.keymap.set('v', '<C-r>', '<ESC>:RunFile<CR>')

vim.keymap.set('v', '<C-f>', '<ESC>:NvimTreeFocus<CR>')
vim.keymap.set('v', '<C-g>', '<ESC>:Telescope find_files<CR>')
vim.keymap.set('v', '<A-Left>', '<Esc>:BufferPrevious<CR>v')
vim.keymap.set('v', '<A-Right>', '<Esc>:BufferNext<CR>v')
vim.keymap.set('v', '“', '<ESC>:BufferMovePrevious<CR>v')
vim.keymap.set('v', '‘', '<ESC>:BufferMoveNext<CR>v')
vim.keymap.set('v', '<A-Up>', '<ESC>:BufferNext<CR>:BufferPrevious<CR>v')
vim.keymap.set('v', '<A-Down>', '<ESC>:BufferClose<CR>v')

vim.keymap.set('v', '<C-c>', '<ESC>') -- Change Mode
vim.keymap.set('v', '<C-e>', '<ESC>i') -- Change Mode

local mappings = {}

mappings['<D-Up>'] = {'scroll', {'-vim.wo.scroll', 'true', '100', [['circular']]}}
mappings['<D-Down>'] = {'scroll', { 'vim.wo.scroll', 'true', '100', [['circular']]}}

require('neoscroll.config').set_mappings(mappings)
