local M = {
  width = 30
}

--- Setup Cmp
--- @return nil
function M.setup()
  local cmp = require('cmp') 

  local abbr_length
  local kind_length

  cmp.setup({
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'nvim_lsp_signature_help' },
      { name = 'buffer' },
      { name = 'codeium' }
    }),

    performance = {
      max_view_entries = 10,
    },

    mapping = cmp.mapping.preset.insert({
	  	['<CR>'] = cmp.mapping.abort(),
  		['<Tab>'] = cmp.mapping.confirm({ select = true })
    }),

    completion = {
      completeopt = 'menu,menuone,noinsert'
    },

    formatting = {
      format = function(_, item)
        item.kind = table.concat({'[', item.kind, ']'})

        abbr_length = item.abbr:len()
        kind_length = item.kind:len()

        if abbr_length > M.width - (kind_length + 4) then
          return { abbr = table.concat({item.abbr:sub(0, M.width - (kind_length + 4)), '... ', item.kind}) }
        else
          return { abbr = table.concat({item.abbr, string.rep(' ', M.width - (abbr_length + kind_length)), item.kind}) }
        end
      end
    }
  }) 

  local servers = require('experimental.plugins.mason').servers
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  for i = 1, #servers do
    require('lspconfig')[servers[i]].setup({
      capabilities = capabilities
    })
  end
end

return M
