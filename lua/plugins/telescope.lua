local M = {}

--- Setup Telescope.
--- @return nil
function M.setup()
  require('telescope').setup({
    defaults = {
      file_ignore_patterns = {'node_modules'}
    }
  })

  vim.keymap.set({'n', 'i', 'v'}, '<C-g>', '<ESC>:Telescope find_files<CR>')
end

return M
