--- Options for the line nubmer.
vim.o.fillchars = "eob: "
vim.o.number = true

--- Options for text wrapping.
vim.wo.wrap = false

--- Options for indenting. 
vim.cmd('set expandtab')
vim.o.tabstop = 2
vim.o.shiftwidth = 2

--- Options for backing up. 
vim.opt.backupdir = vim.fs.joinpath(vim.fn.stdpath('data'), 'backup')
vim.opt.backup = true

local signs = {
  DiagnosticSignHint = ' ',
  DiagnosticSignWarn = ' ',
  DiagnosticSignError = ' ',
  DiagnosticSignInformation = ' '
}

for hightlight, icon in pairs(signs) do
  vim.fn.sign_define(hightlight, { text = icon, texthl = hightlight, numhl = hightlight })
end

require('keymaps').setup()
require('plugins').setup()
