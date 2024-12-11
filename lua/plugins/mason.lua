local M = {
  --- @type string[]
  servers = {
    'ts_ls', 'html', 'cssls',

    'lua_ls', 'pyright',
    'zls', 'csharp_ls',

    'jsonls'
  }
}

--- Setup Mason.
--- @return nil
function M.setup()
  require('mason').setup()
  require('mason-lspconfig').setup({
    ensure_installed = M.servers
  })
end

return M
