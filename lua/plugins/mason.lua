local M = {
  --- @type string[]
  servers = {
    'ts_ls', 'html', 'cssls',

    'lua_ls', 'pyright',
    'zls', 'csharp_ls',
    'clangd',

    'jsonls'
  }
}

--- Setup Mason.
--- @return nil
function M.setup()
  require('mason').setup()
  require('mason-lspconfig').setup({
    ensure_installed = M.servers,
    automatic_installation = true
  })
end

return M
