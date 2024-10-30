local M = {
  --- @type string[]
  parsers = {
    'javascript', 'typescript',
    'html', 'css',

    'python',
    'lua',

    'markdown',
    'json',

    'zig',
    'c_sharp'
  }
}

--- Setup Treesitter
--- @return nil
function M.setup()
  require('nvim-treesitter.configs').setup({
    ensure_installed = M.parsers
  })
end

return M
