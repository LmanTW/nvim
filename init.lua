--- Disable useless stuff.
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python3_provider = 0

--- Options for the line nubmer.
vim.o.fillchars = 'eob: '
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

--- Options for searching.
vim.o.ignorecase = true
vim.o.smartcase = true

local signs = {
  DiagnosticSignHint = ' ',
  DiagnosticSignWarn = ' ',
  DiagnosticSignError = ' ',
  DiagnosticSignInformation = ' '
}

for hightlight, icon in pairs(signs) do
  vim.fn.sign_define(hightlight, { text = icon, texthl = hightlight, numhl = hightlight })
end

--- Enable the experimental loader.
vim.loader.enable()

--- Enable OSC52 clipboard support.
vim.g.clipboard = {
  name = 'osc52',
  copy = {
    ['+'] = function(lines, _) vim.fn.chansend(vim.v.stderr, '\x1b]52;c;' .. vim.fn.system('base64', table.concat(lines, '\n')) .. '\x07') end,
    ['*'] = function(lines, _) vim.fn.chansend(vim.v.stderr, '\x1b]52;c;' .. vim.fn.system('base64', table.concat(lines, '\n')) .. '\x07') end,
  },
  paste = {
    ['+'] = function() return { vim.fn.getreg('+') }, vim.fn.getregtype('+') end,
    ['*'] = function() return { vim.fn.getreg('*') }, vim.fn.getregtype('*') end,
  },
}

require('keymaps').setup()
require('plugins').setup()
