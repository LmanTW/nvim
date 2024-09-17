local M = {
  --- @type string[]
  servers = {
    'eslint', 'ts_ls',
    'html', 'cssls',

    'pyright',
    'lua_ls',

    'marksman',
    'jsonls'
  }
}

--- Setup Mason
--- @return nil
function M.setup()
  require('mason').setup()

  local async

  async = vim.uv.new_async(vim.schedule_wrap(function()
    require('mason-lspconfig').setup({
      ensure_installed = M.servers
    })

    --- Set The Signs

    local signs = {
      DiagnosticSignHint = ' ',
      DiagnosticSignWarn = ' ',
      DiagnosticSignError = ' ',
      DiagnosticSignInformation = ' '
    }

    for hightlight, icon in pairs(signs) do
      vim.fn.sign_define(hightlight, { text = icon, texthl = hightlight, numhl = hightlight })
    end

    async:close()
  end))

  async:send()
end

return M
