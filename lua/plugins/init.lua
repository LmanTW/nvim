local lazy_path = vim.fs.joinpath(vim.fn.stdpath('data'), 'lazy', 'lazy.nvim')

if not vim.uv.fs_stat(lazy_path) then
  vim.fn.system({
    'git', 'clone',
    '--filter=blob:none', '--branch=stable',
    'https://github.com/folke/lazy.nvim.git',
    lazy_path
  })
end

vim.opt.rtp:prepend(lazy_path)

local Keymaps = require('keymaps')

local M = {}

--- Setup the plugins.
--- @return nil
function M.setup()
  require('lazy').setup({
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
      end,

      event = 'BufRead'
    },
    {
      'sontungexpt/better-diagnostic-virtual-text',

      config = function()
        vim.diagnostic.config({ update_in_insert = true, virtual_text = false })

        require('better-diagnostic-virtual-text').setup({
          inline = false
        })

        vim.keymap.set({ 'n', 'i', 'v' }, '<C-z>', function()
          vim.diagnostic.enable(not vim.diagnostic.is_enabled())
        end, Keymaps.options)
      end,

      event = 'BufRead'
    },
    {
      'j-hui/fidget.nvim',

      config = {
        notification = {
          window = {
            x_padding = 2,
            y_padding = 1
          }
        }
      },

      event = 'LspAttach'
    },
    {
      'folke/lazydev.nvim',

      config = {
        library = {
          { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        },
      },

      ft = 'lua'
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
        { 'hrsh7th/cmp-buffer', lazy = true },
        { 'hrsh7th/cmp-nvim-lsp-signature-help', lazy = true }
      },

      config = function()
        require('plugins.nvim-cmp').setup()
      end,

      event = 'BufRead'
    },

    --- Navigation.
    {
      'folke/flash.nvim',

      config = function()
        require('flash').setup({
          labels = 'qwerasdf',

          label = {
            uppercase = false
          },

          modes = {
            char = {
              enabled = false
            }
          }
        })

        vim.keymap.set({ 'n', 'i', 'v' }, '<C-s>', require("flash").jump)
      end,

      event = 'BufRead'
    },
    {
      'petertriho/nvim-scrollbar',

      config = true,

      event = 'VeryLazy'
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
      'KaitoMuraoka/websearcher.nvim',

      init = function()
        vim.keymap.set({'n', 'i', 'v'}, '<C-b>', function()
          vim.cmd('Websearch')
        end)
      end,

      config = {
        search_engine = 'Google'
      }, 

      cmd = 'Websearch'
    },

    --- Decoration.
    {
      'romgrk/barbar.nvim',

      init = function()
        vim.g.barbar_auto_setup = false
      end,

      config = function()
        require('plugins.barbar').setup()
      end,

      event = 'VeryLazy'
    },
    {
      'nvim-lualine/lualine.nvim',

      config = function()
        require('plugins.lualine').setup()
      end
    },

    --- Terminal.
    {
      'akinsho/toggleterm.nvim',

      init = function()
        vim.keymap.set({'n', 'i', 'v'}, '<C-t>', function()
          vim.cmd('ToggleTerm')
        end)
      end,

      config = function()
        require('toggleterm').setup({
          open_mapping = '<C-t>',

          direction = 'float',

          float_opts = {
            border = 'rounded'
          }
        })
      end,

      cmd = 'ToggleTerm'
    },

    --- Colorscheme manager.
    {
      dir = '/Users/lmantw/Desktop/Programming/Primary/themify.nvim',

      config = function()
        require('plugins.themify').setup()
      end
    },

    --- Other.
    {
      'andweeb/presence.nvim',

      event = 'BufRead'
    },
    {
      'iamcco/markdown-preview.nvim',

      build = 'cd app && yarn install',

      init = function()
        vim.g.mkdp_auto_close = false
      end,

      ft = { 'markdown' }
    }
  })
end

return M
