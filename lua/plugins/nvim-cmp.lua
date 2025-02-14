local M = {
  width = 35
}

--- Setup Nvim-Cmp.
--- @return nil
function M.setup()
  local cmp = require('cmp')

  local kind, kind_length
  local abbr, abbr_length

  cmp.setup({
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'nvim_lsp_signature_help' },
      { name = 'buffer' },
      { name = 'lazydev' }
    }),

    performance = {
      max_view_entries = 10,
    },

    mapping = cmp.mapping.preset.insert({
	  	['<CR>'] = cmp.mapping.abort(),
  		['<Tab>'] = cmp.mapping.confirm({ select = true }),
    }),

    completion = {
      completeopt = 'menu,menuone,noinsert'
    },

    formatting = {
      format = function(_, item)
        kind = table.concat({'[', item.kind, ']'})
        kind_length = item.kind:len()

        abbr = item.abbr
        abbr_length = item.abbr:len()

        if abbr_length > M.width - (kind_length + 4) then
          return { abbr = table.concat({abbr:sub(0, M.width - (kind_length + 4)), '... ', kind}) }
        else
          return { abbr = table.concat({abbr, string.rep(' ', M.width - (abbr_length + kind_length)), kind}) }
        end
      end
    }
  })

  local servers = require('plugins.mason').servers
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  --- Just for Zig. 
  vim.g.zig_fmt_autosave = 0

  for i = 1, #servers do
    if servers[i] == 'zls' then
      local zig_capabilities = require('cmp_nvim_lsp').default_capabilities()
      zig_capabilities.textDocument.completion.completionItem.snippetSupport = false

      require('lspconfig')['zls'].setup({ capabilities = zig_capabilities })
    else
      require('lspconfig')[servers[i]].setup({ capabilities = capabilities })
    end
  end
end

return M
