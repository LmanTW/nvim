-- Install LSP Servers

local lsp_servers = {
  'eslint', 'tsserver',
  'html', 'cssls',
  'vuels',
  'volar',

  'lua_ls',
  'gopls',
  'rust_analyzer',

  'marksman',
  'jsonls',

  -- Shit:

  'pyright'
}

local languages = {
  'javascript', 'typescript',
  'html', 'css',

  'python',
  'lua',

  'go',

  'markdown',
  'json'
}

require('mason-lspconfig').setup({ ensure_installed = lsp_servers })

-- Install treesitter Languages

require('nvim-treesitter.configs').setup({
  ensure_installed = languages,

  sync_install = true
})

-- Set Up Language Servers

local capabilities = require('cmp_nvim_lsp').default_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

for name, item in pairs(lsp_servers) do
  if name == 'rust_analyzer' then
    require('lspconfig')['rust-analyzer'] = {
      capabilities = capabilities,

      diagnostics = {
        enable = true
      }
    }
  else
    require('lspconfig')[item].setup({
      capabilities = capabilities
    })
  end
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
