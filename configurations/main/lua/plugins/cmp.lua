local cmp = require('cmp')

cmp.setup({
  snippet = {
  	expand = function(args)
        require('luasnip').lsp_expand(args.body)
    end
  },
	completion = {
    completeopt = 'menu,noinsert'
  },
	mapping = cmp.mapping.preset.insert({
		['<CR>'] = cmp.mapping.abort(),
		['<Tab>'] = cmp.mapping.confirm({ select = true }),
    ['<D-]>'] = cmp.mapping.scroll_docs(-4),
    ['<D-[>'] = cmp.mapping.scroll_docs(4)
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
       maxwidth = 30,
      ellipsis_char = '...'
    })
  }
})
