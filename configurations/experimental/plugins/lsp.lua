-- Install LSP Servers

local lsp_servers = {
  'eslint', 'tsserver',
  'html', 'cssls',
  'vuels',
  'volar',

  'lua_ls',

  'csharp_ls',
  'gopls',

  'marksman',
  'jsonls'
}

local languages = {
  'javascript',
  'typescript',
  'vue',

  'html',
  'css',

  'c_sharp',
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

for _, item in pairs(lsp_servers) do
  if item == 'csharp_ls' then
    require('lspconfig').csharp_ls.setup({
      cmd = { 'csharp-ls' },

      capabilities = capabilities
    })
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
