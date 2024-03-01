require('configurations.main.lua.plugins')

require('configurations.main.lua.plugins.cmp')
require('configurations.main.lua.plugins.lsp')

require('configurations.main.lua.core.options')
require('configurations.main.lua.core.keymaps')

vim.o.fillchars = "eob: "
vim.o.number = true
vim.wo.wrap = false

vim.cmd('set expandtab')
vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.o.ignorecase = true
vim.o.smartcase = true

-- vim.cmd('set autoread')
