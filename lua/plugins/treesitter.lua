local M = {
  --- @type string[]
  parsers = {
    'javascript', 'typescript',
    'html', 'css',

    'lua', 'python',
    'zig', 'c_sharp',

    'json'
  }
}

--- Setup Treesitter.
--- @return nil
function M.setup()
  require('nvim-treesitter.configs').setup({
    ensure_installed = M.parsers
  })
end

return M
