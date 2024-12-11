local M = {}

--- Open a folder.
--- @param path string
--- @return nil
function openFolder(path)
  local windows = vim.api.nvim_list_wins()

  local window
  local buffer

  for i = 1, #windows do
    window = windows[i]
    buffer = vim.api.nvim_win_get_buf(window)

    if vim.bo[buffer].filetype == 'snacks_dashboard' then
      vim.cmd(table.concat({':NvimTreeOpen', path}, ' '))
      vim.fn.chdir(path)

      vim.api.nvim_win_close(window, false)

      return
    end
  end
end

--- Setup Snacks.
--- @return nil
function M.setup()
  local Snacks = require('snacks')

  Snacks.toggle.profiler():map('<C-p>')
  Snacks.toggle.profiler_highlights():map('<C-o>')

  Snacks.setup({
    bigfile = {
      size = 64 * 1024
    },

    dashboard = {
      enabled = true,

      sections = {
        { section = 'header', padding = 3 },
        { section = 'keys', padding = 1 },
        { section = 'projects', padding = 3 },
        { section = 'startup' }
      },

      preset = {
        keys = {
          {
            icon = ' ',
            desc = 'Find File',

            key = 'f',
            action = function()
              openFolder('./')
            end
          },
          {
            icon = ' ',
            desc = 'Config',

            key = 'c',
            action = function()
              openFolder(vim.fn.stdpath('config'))
            end
          }
        }
      }
    },

    lazygit = {
      enabled = true,
    },

    styles = {
      dashboard = {
        bo = {
          bufhidden = 'wipe',
          buftype = 'nofile',
          filetype = 'snacks_dashboard',
          swapfile = false,
          undofile = false,
        }
      }
    }
  })
end

return M
