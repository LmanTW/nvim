local M = {}

--- Setup Snacks.
--- @return nil
function M.setup()
  require('snacks').setup({
    bigfile = {
      size = 64 * 1024
    },

    dashboard = {
      enabled = true,

      sections = {
        { section = 'header', padding = 3 },
        { section = 'keys', padding = 1 },
        { section = 'recent_files', padding = 3 },
        { section = 'startup' }
      },

      preset = {
        keys = {
          {
            icon = ' ',
            desc = 'Find File',

            key = 'f',
            action = function()
              local windows = vim.api.nvim_list_wins()

              local window
              local buffer
          
              for i = 1, #windows do
                window = windows[i]
                buffer = vim.api.nvim_win_get_buf(window)
          
                if vim.bo[buffer].filetype == 'snacks_dashboard' then
                  vim.cmd(':NvimTreeOpen')
                  vim.api.nvim_win_close(window, false)
          
                  return
                end
              end
            end
          },
          {
            icon = ' ',
            desc = 'Config',

            key = 'c', 
            action = function()
              local windows = vim.api.nvim_list_wins()

              local window
              local buffer
          
              for i = 1, #windows do
                window = windows[i]
                buffer = vim.api.nvim_win_get_buf(window)
          
                if vim.bo[buffer].filetype == 'snacks_dashboard' then
                  vim.cmd(':NvimTreeOpen ~/.config/nvim')
                  vim.api.nvim_win_close(window, false)
          
                  return
                end
              end
            end
          },
          {
            icon = ' ',
            desc = 'Quit',

            key = 'q',
            action = ':qa'
          },
        },
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
