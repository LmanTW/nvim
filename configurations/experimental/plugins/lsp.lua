-- Install LSP Servers

local lsp_servers = {
  'eslint', 'tsserver',
  'html', 'cssls',

  'lua_ls',

  'gopls',

  'marksman',
  'jsonls'
}

local languages = {
  'javascript',
  'typescript',

  'html',
  'css',

  'go',

  'markdown',
  'json'
}

require('mason-lspconfig').setup({ ensure_installed = lsp_servers })

-- Install treesitter Languages

require('nvim-treesitter').setup({ ensure_installed = languages })

-- Set Up Language Servers

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

for _, item in pairs(lsp_servers) do
  require('lspconfig')[item].setup({
    capabilities = capabilities
  })
end

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
