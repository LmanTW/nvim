local Keymaps = require('keymaps')

local M = {}

--- Open a folder.
--- @param path string
--- @return nil
local function open_folder(path)
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

  --- Snacks.toggle.profiler():map('<C-p>')
  --- Snacks.toggle.profiler_highlights():map('<C-o>')

  Snacks.setup({
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
              open_folder('./')
            end
          },
          {
            icon = ' ',
            desc = 'Config',

            key = 'c',
            action = function()
              open_folder(vim.fn.stdpath('config'))
            end
          }
        }
      }
    },

    picker = {
      win = {
        input = {
          keys = {
            ['<Esc>'] = { 'close', mode = {'n', 'i', 'v'}},
            ['<Space>'] = { 'confirm', mode = {'n', 'v'}},

            ['<Up>'] = { 'list_up', mode = {'n', 'i', 'v'}},
            ['<Down>'] = { 'list_down', mode = {'n', 'i', 'v'}},

            ['<S-Up>'] = { 'list_top', mode = {'n', 'i', 'v'}},
            ['<S-Down>'] = { 'list_bottom', mode = {'n', 'i', 'v'}}
          }
        }
      }
    },

    image = {
      markdown = {
        enabled = false
      }
    },

    bigfile = {
      notify = false,
      size = 256 * 1024,
      line_length = 1024
    }
  })

  vim.keymap.set({'n', 'i', 'v'}, '<C-g>', function()
    Snacks.picker({
      finder = 'files',
      format = 'file',

      hidden = true,
      ignored = false
    })
  end, Keymaps.options)

  vim.keymap.set({'n', 'i', 'v'}, '<C-b>', function()
    Snacks.picker({
      finder = 'grep',
      format = 'file',

      live = true,
      regex = true
    })
  end, Keymaps.options)

  vim.keymap.set({'n', 'i', 'v'}, '<C-v>', function()
    Snacks.picker({
      finder = 'lsp_symbols',
      format = 'lsp_symbol',

      filter = {
        typescript = {
          'Namespace',
          'Class',
          'Method',
          'Function',
          'Interface'
        },

        zig = {
          'Constant',
          'Function'
        }
      },

      tree = true
    })
  end, Keymaps.options)

  vim.keymap.set({'n', 'i', 'v'}, '<C-l>', Snacks.lazygit.open, Keymaps.options)
end

return M
