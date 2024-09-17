local M = {}

--- Setup Coq
--- @return nil
function M.setup()
  vim.g.coq_settings = {
    auto_start = 'shut-up',

    clients = {
      lsp = { enabled = true, short_name = "LSP" },
      snippets = { enabled = true, short_name = "Snippet" },
      buffers = { enabled = true, short_name = "Buffer" }
    },

    completion = {
      skip_after = {'(', ')', '{', '}', '[', ']', ',', ';'}
    },

    keymap = {
      pre_select = true,
      recommended = false
    },

    display = {
      pum = {
        source_context = {'(', ')'}
      },

      ghost_text = {
        enabled = false
      },

      preview = {
        positions = { south = 2, east = 1, north = nil, west = nil }
      }
    }
  }

  vim.api.nvim_set_keymap('i', '<Tab>', [[pumvisible() ? "\<CR>" : "\<Tab>"]], { expr = true, silent = true })
  vim.api.nvim_set_keymap('i', '<BS>', [[pumvisible() ? "\<C-e><BS>" : "\<BS>"]], { expr = true, silent = true })

  -- Setup The Language Servers

  local coq = require('coq')
  local servers = require('experimental.plugins.mason').servers

  local capabilities = vim.lsp.protocol.make_client_capabilities()

  for i = 1, #servers do
    require('lspconfig')[servers[i]].setup(coq.lsp_ensure_capabilities({
      capabilities = capabilities
    }))
  end

  require('coq_3p')({
    { src = 'bc', short_name = 'Math', precision = 6 },
    { src = 'nvimlua', short_name = 'NeoLua' },
    { src = 'codeium', short_name = 'Codeium' },
  })
end

return M
