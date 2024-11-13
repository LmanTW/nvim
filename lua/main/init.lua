--- Line Number Options
vim.o.fillchars = "eob: "
vim.o.number = true

--- Text Wrapping Options
vim.wo.wrap = false

--- Indenting Options
vim.cmd('set expandtab')
vim.o.tabstop = 2
vim.o.shiftwidth = 2

--- Backup Options
vim.opt.backupdir = vim.fs.joinpath(vim.fn.stdpath('data'), 'backup')
vim.opt.backup = true

--- Disable Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('experimental.keymaps').setup()
require('experimental.plugins').setup()
