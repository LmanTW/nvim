local Keymaps = require('keymaps')

local M = {}

--- Setup Nvim-Tree.
--- @return nil
function M.setup()
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  require('nvim-tree').setup({
    sort = {
      sorter = 'case_sensitive',
      folders_first = true
    },

    filters = {
      custom = {'.DS_Store', '__pycache__'}
    },

    view = {
      side = 'left',
      width = 25
    },

    renderer = {
      icons = {
        show = {
          file = false,
          folder = false
        }
      }
    },

    on_attach = function(buffer)
      local api = require('nvim-tree.api')

      local options = { buffer = buffer, nowait = true, silent = true }

      vim.keymap.set('n', '<Space>', api.node.open.edit, options)
      vim.keymap.set('n', '<C-v>', api.node.open.vertical, options)
      vim.keymap.set('n', '<CR>', api.node.open.edit, options)
      vim.keymap.set('n', '<Tab>', api.tree.expand_all, options)
      vim.keymap.set('n', 'c', api.tree.change_root_to_node)

      vim.keymap.set('n', '<Left>', api.node.navigate.sibling.prev, options)
      vim.keymap.set('n', '<Right>', api.node.navigate.sibling.next, options)
      vim.keymap.set('n', 'f', api.live_filter.start, options)

      vim.keymap.set('n', 'a', api.fs.create, options)
      vim.keymap.set('n', 'r', api.fs.rename, options)
      vim.keymap.set('n', 'd', api.fs.remove, options)
   end,

    git = { enable = false },

    filesystem_watchers = {
      enable = true,
      debounce_delay = 100,

      ignore_dirs = {'node_modules', '.zig-cache'}
    }
  })

  vim.keymap.set({'n', 'v'}, '<C-f>', ':NvimTreeFocus<CR>', Keymaps.options)
  vim.keymap.set('i', '<C-f>', '<ESC>:NvimTreeFocus<CR>', Keymaps.options)
end

return M
