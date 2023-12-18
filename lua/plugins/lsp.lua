require('mason').setup()

local lsp = {
	'eslint',
  'tsserver',
	'html',
	'cssls',
	'jsonls',
  'lua_ls',

  'volar'
}

--say hello

require('mason-lspconfig').setup({ ensure_installed = lsp })

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

for _,item in pairs(lsp) do
	if (item == 'lua_ls') then
    require('lspconfig').lua_ls.setup({
      capabilities = capabilities,
			settings = {
    	  Lua = {
    	    diagnostics = {
    	      globals = { 'vim' }
    	    }
    	  }
    	}
		})
  else
  	require('lspconfig')[item].setup({
  	  capabilities = capabilities
		})
	end
end

vim.diagnostic.config({
	update_in_insert = true
})

local signs = {
  Error = '',
  Warn = '',
  Hint = '',
  Information = ''
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end
