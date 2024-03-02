-- Load CMP

local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
  snippet = {
    expand = function (args)
      require('snippy').expand_snippet(args.body)
    end
  },

  sources = cmp.config.sources({
    { name = 'nvim_lsp', max_item_count = 7 },
    { name = 'snippy' },
    { name = "codeium" }
  }, {
    { name = 'buffer' },
  }),

	completion = {
    completeopt = 'menu,noinsert'
  },

	preselect = cmp.PreselectMode.None,

  mapping = cmp.mapping.preset.insert({
		['<CR>'] = cmp.mapping.abort(),
		['<Tab>'] = cmp.mapping.confirm({ select = true }),
    ['<D-[>'] = cmp.mapping.scroll_docs(-1),
    ['<D-]>'] = cmp.mapping.scroll_docs(1)
  }),

  window = {
    completion = { -- rounded border; thin-style scrollbar
      border = 'rounded',
      scrollbar = '║'
    },
    documentation = { -- no border; native-style scrollbar
      border = 'rounded',
      scrollbar = '║'
    },
  },

  formatting = {
    format = lspkind.cmp_format({
      maxwidth = 35,

      ellipsis_char = '...' 
    })
  }
})

-- Load LSP Servers

local capabilities = require('cmp_nvim_lsp').default_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

local lsp_servers = require('configurations.experimental.plugins.lsp')

for _, name in pairs(lsp_servers) do
  require('lspconfig')[name].setup({
    capabilities = capabilities
  })
end
