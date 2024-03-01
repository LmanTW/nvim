-- Install LSP Servers

local lsp_servers = {
  'eslint', 'tsserver',
  'html', 'cssls',

  'lua_ls',

  'gopls',

  'jsonls'
}

local languages = {
  "javascript"
}

require('mason-lspconfig').setup({ ensure_installed = lsp_servers })

-- Install treesitter Languages

require('nvim-treesitter').setup({ ensure_installed = languages })

-- Set Signs

local signs = {
  Error = ' ',
  Warn = ' ',
  Hint = ' ',
  Information = ' '
}

for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type

  vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end

return lsp_servers
