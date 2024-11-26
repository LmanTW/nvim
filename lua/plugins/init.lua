local lazy_path = vim.fs.joinpath(vim.fn.stdpath('data'), 'lazy', 'lazy.nvim')

if not vim.uv.fs_stat(lazy_path) then
  vim.fn.system({
    "git", "clone",
    "--filter=blob:none", "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazy_path 
  })
end

vim.opt.rtp:prepend(lazy_path)

local Keymaps = require('keymaps')

local M = {}

--- Setup the plugins.
--- @return nil
function M.setup()
  require("lazy").setup({
    --- Startup dashboard.
    {
      'folke/snacks.nvim',

      config = function()
        require('plugins.snacks').setup()
      end
    },

    --- Language support.
    {
      'williamboman/mason.nvim',

      dependencies = {
        { 'neovim/nvim-lspconfig', lazy = true },
        { 'williamboman/mason-lspconfig.nvim', lazy = true }
      },

      config = function()
        require('plugins.mason').setup()
      end
    },
    {
      'nvim-treesitter/nvim-treesitter',

      config = function()
        require('plugins.treesitter').setup()
      end
    },
    {
      'sontungexpt/better-diagnostic-virtual-text',

      config = function()
        vim.diagnostic.config({ update_in_insert = true, virtual_text = false })

        require('better-diagnostic-virtual-text').setup({
          inline = false
        })

        vim.keymap.set({'n', 'i', 'v'}, '<C-z>', function()
          vim.diagnostic.enable(not vim.diagnostic.is_enabled())
        end, Keymaps.options)
      end,

      event = 'BufRead'
    },

    --- Editing.
    {
      'windwp/nvim-autopairs',

      config = true,

      event = 'InsertEnter'
    },
    {
      'windwp/nvim-ts-autotag',

      config = true,

      event = 'InsertEnter'
    },
    {
      'hrsh7th/nvim-cmp',

      dependencies = {
        { 'hrsh7th/cmp-nvim-lsp', lazy = true },
        { 'hrsh7th/cmp-nvim-lsp-signature-help', lazy = true },
        { 'hrsh7th/cmp-buffer', lazy = true }
      },

      config = function()
        require('plugins.nvim-cmp').setup()
      end,

      event = 'BufReadPre'
    },

    --- Navigation.
    {
      'phaazon/hop.nvim',

      branch = 'v2',

      config = function()
        require('hop').setup()

        vim.keymap.set({'n', 'v'}, '<C-s>', ':HopWord<CR>')
        vim.keymap.set('i', '<C-s>', '<ESC>:HopWord<CR>')
      end
    },

    --- Media explorer.
    {
      'nvim-tree/nvim-tree.lua',

      init = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
      end,

      config = function()
        require('plugins.nvim-tree').setup()
      end
    },
    {
      'nvim-telescope/telescope.nvim',

      dependencies = {
        { 'nvim-lua/plenary.nvim', lazy = true }
      },

      config = function()
        require('plugins.telescope').setup()
      end
    },

    --- Tabline.
    {
      'romgrk/barbar.nvim',

      init = function()
        vim.g.barbar_auto_setup = false
      end,

      config = function()
        require('plugins.barbar').setup()
      end
    },

    --- Terminal.
    {
      'akinsho/toggleterm.nvim',

      config = function()
        require('toggleterm').setup({
          open_mapping = '<C-t>',

          direction = 'float',

          float_opts = {
            border = 'rounded'
          }
        })
      end
    },

    --- Colorscheme manager.
---    {
---      'lmantw/themify.nvim',
---
---      config = function()
---        require('plugins.themify').setup()
---      end
---    },
    {
      dir = '/Users/lmantw/Desktop/Programming/themify.nvim',

      config = function()
        require('plugins.themify').setup()
      end
    },
  })
end

return M
