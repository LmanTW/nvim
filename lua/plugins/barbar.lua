local Keymaps = require('keymaps')

local M = {}

--- Setup Barbar.
--- @return nil
function M.setup()
  vim.g.barbar_auto_setup = false

  require('barbar').setup({
    animation = false,

    icons = {
      filetype = {
        enabled = false
      },

      diagnostics = {
--        [vim.diagnostic.severity.HINT] = { enabled = true, icon = ' '},
--        [vim.diagnostic.severity.WARN] = { enabled = true, icon = ' '},
--        [vim.diagnostic.severity.ERROR] = { enabled = false, icon = ' ' },
      },
    }
  })

  vim.keymap.set({'n', 'v'}, '<A-Left>', ':BufferPrevious<CR>', Keymaps.options)
  vim.keymap.set('i', '<A-Left>', '<ESC>:BufferPrevious<CR>', Keymaps.options)
  vim.keymap.set({'n', 'v'}, '<A-Right>', ':BufferNext<CR>', Keymaps.options)
  vim.keymap.set('i', '<A-Right>', '<ESC>:BufferNext<CR>', Keymaps.options)

  vim.keymap.set({'n', 'v'}, '<S-A-Left>', ':BufferMovePrevious<CR>', Keymaps.options)
  vim.keymap.set('i', '<S-A-Left>', '<ESC>:BufferMovePrevious<CR>i', Keymaps.options)
  vim.keymap.set({'n', 'v'}, '<S-A-Right>', ':BufferMoveNext<CR>', Keymaps.options)
  vim.keymap.set('i', '<S-A-Right>', '<ESC>:BufferMoveNext<CR>i', Keymaps.options)

  vim.keymap.set({'n', 'i', 'v'}, '<A-Up>', function()
    local current_tab = vim.api.nvim_get_current_tabpage()
    local windows = vim.api.nvim_tabpage_list_wins(current_tab)

    local window
    local buffer

    for i = 1, #windows do
      window = windows[i]
      buffer = vim.api.nvim_win_get_buf(window)

      if vim.bo[buffer].buftype == '' then
        vim.api.nvim_set_current_win(window)

        return
      end
    end
  end, Keymaps.options)

  vim.keymap.set({'n', 'v'}, '<A-Down>', ':BufferClose<CR>', Keymaps.options)
  vim.keymap.set('i', '<A-Down>', ':BufferClose<CR>i', Keymaps.options)
end

return M
