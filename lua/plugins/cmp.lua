local cmp = require('cmp')

cmp.setup({
  snippet = {
  	expand = function(args)
        require('luasnip').lsp_expand(args.body)
    end
  },
	completion = {
    completeopt = 'menu,menuone,noinsert,preview'
  },
	mapping = cmp.mapping.preset.insert({
		['<CR>'] = cmp.mapping.abort(),
		['<Tab>'] = cmp.mapping.confirm({ select = true })
  }),
	preselect = cmp.PreselectMode.None,
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = "codeium" }
	}, {
    { name = 'buffer' }
	}),
  formatting = {
    format = require('lspkind').cmp_format({
      maxwidth = 35,
      ellipsis_char = '...'
    })
  }
})
