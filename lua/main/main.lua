-- Options

vim.o.fillchars = "eob: "
vim.o.number = true
vim.wo.wrap = false

vim.cmd('set expandtab')
vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.o.ignorecase = true
vim.o.smartcase = true

vim.diagnostic.config({ update_in_insert = true, virtual_text = false })

vim.opt.backupdir = '/Users/lmantw/.local/share/nvim/backup/'
vim.opt.backup = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Require

require('configurations.experimental.plugins')

require('configurations.experimental.plugins.lsp')

require('configurations.experimental.keymaps')

-- LSP Test

--vim.lsp.start({
-- name = 'Boxes',
--
--  cmd = {'boxes-language-server' },
--})
